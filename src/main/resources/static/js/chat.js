
var stompClient = null;
function connectToWebSocket() {
    // Connect to the WebSocket endpoint
    var socket = new SockJS('/websocket-endpoint');
     stompClient = Stomp.over(socket);

    // Handle successful connection
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);

        // Retrieve chatRoomId
        var chatRoomId = document.getElementById("chatRoomId").value;

        // Subscribe userSenderId and userReceiveId to the shared chat room destination
        var sharedDestination = '/topic/chatroom/' + chatRoomId;

        stompClient.subscribe(sharedDestination, function (message) {

            var receivedMessage = JSON.parse(message.body).messageContent;
            var date = JSON.parse(message.body).createdAt;
            var senderId = JSON.parse(message.body).senderId
            // Handle the received message for userSenderId and userReceiveId in the specific chat room
            // ...

            appendMessage(receivedMessage,date,senderId );
        });
    });

    // Handle WebSocket connection close
    socket.onclose = function () {
        console.log('WebSocket connection closed');
        // Perform any necessary cleanup or additional actions
        // ...
    };
}

// Function to append a message to the chat window
function appendMessage(message, date,senderId) {

    var chatWindow = document.getElementById("chatWindow");
    var sessionId = document.getElementById("senderId").value;


    //get current date
    var currentDate = new Date();


    // Create the main container div
    var containerDiv = document.createElement('div');
    if(senderId == sessionId){
        containerDiv.className = 'chat-message-right mb-4';
    }
    else{
        containerDiv.className = 'chat-message-left mb-4';
    }

    // Create the inner div for the message content
    var messageDiv = document.createElement('div');

    // Create the timestamp div
    var timestampDiv = document.createElement('div');
    timestampDiv.className = 'text-muted small text-nowrap mt-2';
    timestampDiv.textContent = currentDate.toDateString();

    // Create the message bubble div
    var bubbleDiv = document.createElement('div');
    bubbleDiv.className = 'flex-shrink-1 bg-light rounded py-2 px-3 mr-3';
    bubbleDiv.textContent = message;

    // Append the elements to their respective parent containers
    messageDiv.appendChild(timestampDiv);
    messageDiv.appendChild(bubbleDiv);

    containerDiv.appendChild(messageDiv);

    // Append the main container to the chat window
    chatWindow.appendChild(containerDiv);
}

// Function to send a message through the WebSocket connection
function sendMessage() {
    //get chatroom from template

    var messageInput = document.getElementById("messageInput");
    var message = messageInput.value;
    var chatRoomId = document.getElementById("chatRoomId").value;
    var senderId = document.getElementById("senderId").value;
    if(message && stompClient) {
        var messageObj = {
            messageContent: message,
            senderId : senderId,
        };

        // Send the message through the WebSocket connection
        stompClient.send("/app/chat.sendMessage/" + chatRoomId, {}, JSON.stringify(messageObj));

        // Clear the message input field
        messageInput.value = "";
    }

}

// Call the connectToWebSocket function to establish the WebSocket connection
connectToWebSocket();