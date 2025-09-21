package com.example.demo.service;

import com.example.demo.model.*;
import com.example.demo.repositories.*;

import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class BlogService {
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private HomeService homeService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private VoteRepository voteRepository;

    @Autowired
    private FollowRepository followRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private SavePostRepository savePostRepository;

//    @Cacheable(value = "posts", key = "#id")
    public String viewPost(int id, Model model, HttpSession session) {
        List<Category> listCategory = homeService.getListCategory();
        Post post = postRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Post not found"));
//        get all comment and sort by date
        List<Comment> commentList = commentRepository.getCommentByPostId(id);
//      get author of blog
        User user = userRepository.findById(post.getUser().getUserId()).orElseThrow(() -> new EntityNotFoundException("user not found"));
        Comment comment = new Comment();
//        if user logined
        if (session.getAttribute("userID") != null) {
//            get user id
            int viewerid = (int) session.getAttribute("userID");
//            get upvote, downvote status see if user have up/down this blog or not
            Vote v = voteRepository.getVoteByUserPost(viewerid, id);
            if (v != null) {
                model.addAttribute("voteStatus", v.getUpvote());
            }
//      set post id for comment to see which post is comment in

            comment.setPost(post);
//      add notification
            User u = userRepository.findById(viewerid).orElseThrow();
            model.addAttribute("userNotify", u.getUserNotification());

            if ((int) session.getAttribute("userAuthor") == 5) {
                model.addAttribute("adminNotify", user.getAdminNotification());
            }
        }
//        get url of post
        String url = "viewBlog?id=" + id;


//      get vote = upvote - downvote
        int vote = post.getUpVote() - post.getDownVote();
//        if content of post contain html, set to content Html
        if (containsHtmlTags(post.getPostContent())) {
            model.addAttribute("contentHtml", post.getPostContent());
        }
        //        if content of post not contain html, set to content text
        if (!containsHtmlTags(post.getPostContent())) {
            model.addAttribute("contentText", post.getPostContent());
        }
//        sent comment list to template
        model.addAttribute("commentList", commentList);
//        sent comment object to add new comment
        model.addAttribute("comment", comment);
        model.addAttribute("listCategory", listCategory);
        model.addAttribute("post", post);
        model.addAttribute("user", user);
        model.addAttribute("vote", vote);
        model.addAttribute("url", url);
        return "ReadBlog/readBlog";
    }

    public static boolean containsHtmlTags(String input) {
        Pattern pattern = Pattern.compile("<[^>]*>");
        return pattern.matcher(input).find();
    }


    public String upvote(int id, RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("userID") != null) {
            Post post = postRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Post not found"));
            int userId = (int) session.getAttribute("userID");
            Vote vote = voteRepository.getVoteByUserPost(userId, id);
            User user = userRepository.findById(userId).orElseThrow();
            String message = "người dùng " + user.getUserName() + " đã upvote bài viết " + post.getPostTitle() + " của bạn";
//          day vote created
            LocalDateTime now = LocalDateTime.now();
            Notification notification = new Notification();
//            set notify for user
            notification.setCreatedAt(now);
            notification.setNotificationContent(message);
            notification.setUserReceiverNotification(post.getUser());
            notification.setNotificationLink("./viewBlog?id=" + id);
            notification.setUserRelate(user);

            notificationRepository.save(notification);
            if (vote == null) {
                post.setUpVote(post.getUpVote() + 1);
                Vote v = new Vote();
                v.setPostId(id);
                v.setUserId(userId);
                v.setUpvote("up");
                postRepository.save(post);
                voteRepository.save(v);
                post.getUser().setUserNotification(post.getUser().getUserNotification() + 1);
            } else {
                if (vote.getUpvote().equals("up")) {
                    post.setUpVote(post.getUpVote() - 1);
                    voteRepository.delete(vote);
                    postRepository.save(post);
                    notificationRepository.delete(notification);
                }
                if (vote.getUpvote().equals("down")) {
                    post.setUpVote(post.getUpVote() + 1);
                    post.setDownVote(post.getDownVote() - 1);
                    vote.setUpvote("up");

                    voteRepository.save(vote);
                    postRepository.save(post);
                    post.getUser().setUserNotification(post.getUser().getUserNotification() + 1);
                }
            }


            attributes.addAttribute("id", id);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message", "you have to login to use that function");
        return "redirect:./tologin";
    }


    public String downvote(int id, RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("userID") != null) {
            Post post = postRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Post not found"));
            int userId = (int) session.getAttribute("userID");
            Vote vote = voteRepository.getVoteByUserPost(userId, id);

            User user = userRepository.findById(userId).orElseThrow();
            String message = "người dùng " + user.getUserName() + " đã downvote bài viết " + post.getPostTitle() + " của bạn";
            LocalDateTime now = LocalDateTime.now();
            Notification notification = new Notification();
//            set notify for user
            notification.setCreatedAt(now);
            notification.setNotificationContent(message);
            notification.setUserReceiverNotification(post.getUser());
            notification.setNotificationLink("./viewBlog?id=" + id);
            notification.setUserRelate(user);

            notificationRepository.save(notification);

            if (vote == null) {
                post.setDownVote(post.getDownVote() + 1);
                Vote v = new Vote();
                v.setPostId(id);
                v.setUserId(userId);
                v.setUpvote("down");
                postRepository.save(post);
                voteRepository.save(v);
                post.getUser().setUserNotification(post.getUser().getUserNotification() + 1);
            } else {
                if (vote.getUpvote().equals("down")) {
                    post.setDownVote(post.getDownVote() - 1);
                    voteRepository.delete(vote);
                    postRepository.save(post);
                    notificationRepository.delete(notification);
                }
                if (vote.getUpvote().equals("up")) {
                    post.setUpVote(post.getUpVote() - 1);
                    post.setDownVote(post.getDownVote() + 1);
                    vote.setUpvote("down");

                    voteRepository.save(vote);
                    postRepository.save(post);
                    post.getUser().setUserNotification(post.getUser().getUserNotification() + 1);
                }
            }


            attributes.addAttribute("id", id);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message", "you have to login to use that function");
        return "redirect:./tologin";
    }

    public String toWriteBlog(Model model, HttpSession session) {

        if (session.getAttribute("userID") != null) {
            Post p = new Post();

            int userid = (int) session.getAttribute("userID");
            User user = userRepository.findById(userid).orElseThrow();
            model.addAttribute("userNotify", user.getUserNotification());

            if ((int) session.getAttribute("userAuthor") == 5) {
                model.addAttribute("adminNotify", user.getAdminNotification());
            }
//
//            p.setUser(user);
            p.setDownVote(0);
            p.setUpVote(0);
            List<Category> listCategory = homeService.getListCategory();
            model.addAttribute("listCategory", listCategory);
            model.addAttribute("Blog", p);

            return "WriteBlog/rich_tech_editor";
        }
        session.setAttribute("message", "you have to login to use that function");
        return "redirect:./tologin";

    }

    public String getImgFromContent(String content) {
        String regex = "<img.*?src=\"(.*?)\"";

        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(content);

        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }

    //    @CachePut(value = "posts", key = "#post.id")
    public String addNewBlog(Post post, RedirectAttributes attributes, Set<Integer> categories, HttpSession session) {
        LocalDateTime now = LocalDateTime.now();

        Post p = new Post();
        List<Category> list = categoryRepository.findAllById(categories);
        Set<Category> lc = new HashSet<>(list);


        int userid = (int) session.getAttribute("userID");
        User user = userRepository.findById(userid).orElseThrow(() -> new EntityNotFoundException(""));

        p.setUser(user);
        p.setCreatedAt(now);
        p.setUpVote(post.getUpVote());
        p.setDownVote(post.getDownVote());
        p.setPostTitle(post.getPostTitle());
        p.setPostContent(post.getPostContent());
        p.setSummary(post.getSummary());
        p.setListCategory(lc);
        p.setPostImg(getImgFromContent(post.getPostContent()));
        if (p.getPostImg() == null) {
            p.setPostImg("/img/tohsaka.jpg");
        }


        postRepository.save(p);

        return "redirect:/home";
    }

    public String toYourBlog(Model model, HttpSession session, int pageNo, int pageSize) {
        if (session.getAttribute("userID") != null) {

            List<Category> listCategory = categoryRepository.findAll();
            User user = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();

            Pageable pageable = PageRequest.of(pageNo, pageSize);
            Page<Post> userPost = postRepository.getAllPostByUser((int) session.getAttribute("userID"), pageable);

            List<Integer> numFollower = followRepository.getFollowerId(user.getUserId());
            List<Integer> numUserYouFollowing = followRepository.getUserFollowed(user.getUserId());

            List<User> Followers = new ArrayList<>();
            List<User> userFolloweds = new ArrayList<>();

            for (int i = 0; i < numFollower.size(); i++) {
                User u = userRepository.findById(numFollower.get(i)).orElseThrow();
                Followers.add(u);
            }


            for (int i = 0; i < numUserYouFollowing.size(); i++) {
                User u = userRepository.findById(numUserYouFollowing.get(i)).orElseThrow();
                userFolloweds.add(u);
            }
            if ((int) session.getAttribute("userAuthor") == 5) {
                model.addAttribute("adminNotify", user.getAdminNotification());
            }
            model.addAttribute("userNotify", user.getUserNotification());
            model.addAttribute("Followers", Followers);
            model.addAttribute("userFolloweds", userFolloweds);
            model.addAttribute("numFollower", numFollower.size());
            model.addAttribute("numUserYouFollowing", numUserYouFollowing.size());
            model.addAttribute("numPage", userPost.getTotalPages());
            model.addAttribute("currentPage", pageNo);
            model.addAttribute("user", user);
            model.addAttribute("listCategory", listCategory);
            model.addAttribute("userPost", userPost.getContent());
        } else {
            session.setAttribute("message", "You have to login to do first");
            return "Login/login";
        }

        return "ManageYourBlog/listBlog";
    }

    @CacheEvict(value = "posts", key = "#id")
    public String deleteYourPost(int id, HttpSession session) {
        if (session.getAttribute("userID") != null) {
            Post post = postRepository.findById(id).orElseThrow();
            if ((int) session.getAttribute("userID") == post.getUser().getUserId()) {
                postRepository.deleteById(id);
            }
        } else {
            session.setAttribute("message", "You have to login to do first");
            return "Login/login";
        }


        return "redirect:./toYourBlog";
    }

    public String toAuthorBlog(int authorId, Model model, int pageNo, int pageSize, HttpSession session) {
        if (session.getAttribute("userID") != null) {
            Follow follow = followRepository.getFollow(authorId, (int) session.getAttribute("userID"));
            if (follow == null) {
                model.addAttribute("followStatus", "");
            } else {
                model.addAttribute("followStatus", "followed");
            }
            User u = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify", u.getUserNotification());
            if ((int) session.getAttribute("userAuthor") == 5) {
                model.addAttribute("adminNotify", u.getAdminNotification());
            }
        }


        List<Category> listCategory = categoryRepository.findAll();
        User user = userRepository.findById(authorId).orElseThrow(() -> new EntityNotFoundException("not found user"));

        Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<Post> authorPost = postRepository.getAllPostByUser(authorId, pageable);


        model.addAttribute("numPage", authorPost.getTotalPages());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("user", user);
        model.addAttribute("listCategory", listCategory);
        model.addAttribute("authorPost", authorPost.getContent());
        return "AuthorBlog/authorBlog";
    }


    public String ReportPost(int id, String reason, HttpSession session, Model model, RedirectAttributes attributes) {
        if (session.getAttribute("userID") != null) {

            User user = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();
            Post post = postRepository.findById(id).orElseThrow();
//            get time now
            LocalDateTime now = LocalDateTime.now();
            Report report = new Report();

            report.setCreatedAt(now);
            report.setPost(post);
            report.setUser(user);
            report.setReportReason(reason);
            model.addAttribute("report", report);

            reportRepository.save(report);

//            add notification for admins
            List<User> listAdmin = userRepository.getAllAdmin();
            for (User admin : listAdmin) {
                admin.setAdminNotification(admin.getAdminNotification() + 1);
            }

            attributes.addAttribute("id", id);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message", "You have to login to do it");
        return "Login/login";
    }

    public String savePost(int postId, HttpSession session, RedirectAttributes attributes) {
        if (session.getAttribute("userID") != null) {
//            get the post by postId
            Post post = postRepository.findById(postId).orElseThrow();
//            get time now
            LocalDateTime now = LocalDateTime.now();
//            get user who want to save post
            User user = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();
//            check if this user have already save this post before or not
            Savepost savepost = savePostRepository.getSavepostByUserIdAndPostId(user.getUserId(), postId);
//            user saved this post once time before
            if (savepost != null) {
                savepost.setCreatedAt(now);
                savePostRepository.save(savepost);
            }
//            this is the first time this user save this post
            else {
                Savepost s = new Savepost();
                s.setCreatedAt(now);
                s.setUser(user);
                s.setPost(post);
                savePostRepository.save(s);
            }

            attributes.addAttribute("id", postId);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message", "You have to login to do it");
        return "Login/login";

    }

    public String toSavedPost(HttpSession session, Model model, int pageNo, int pageSize) {
        if (session.getAttribute("userID") != null) {
            Pageable pageable = PageRequest.of(pageNo, pageSize);
            User u = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();


            Page<Savepost> saveposts = savePostRepository.getSavedPost((int) session.getAttribute("userID"), pageable);
            List<Category> listCategory = categoryRepository.findAll();


            if ((int) session.getAttribute("userAuthor") == 5) {
                model.addAttribute("adminNotify", u.getAdminNotification());
            }
            model.addAttribute("userNotify", u.getUserNotification());
            model.addAttribute("numPage", saveposts.getTotalPages());
            model.addAttribute("currentPage", pageNo);
            model.addAttribute("listCategory", listCategory);
            model.addAttribute("savedPosts", saveposts.getContent());

            return "ManageYourBlog/savePost";
        }
        session.setAttribute("message", "You have to login to do it");
        return "Login/login";
    }

    public String removeSavedPost(int id, HttpSession session, RedirectAttributes attributes) {
        if (session.getAttribute("userID") != null) {
            Savepost savepost = savePostRepository.findById(id).orElseThrow();
            savePostRepository.delete(savepost);
            return "redirect:./toSavedPost";
        }
        session.setAttribute("message", "You have to login to do it");
        return "Login/login";
    }

    public String shareByFacebook(String url) {
//        return "redirect:https://www.facebook.com/dialog/feed?app_id=<APP_ID>&display=popup&link=<URL>&redirect_uri=" + url;
        return "redirect:https://www.facebook.com/dialog/feed?app_id=<APP_ID>&display=popup&link=" + url + "&redirect_uri=<REDIRECT_URI>";
    }
}
