@extends('admin.main')

@section('content')
<section class="main-chat">
  <div class="messaging">
    <div class="inbox_msg">
      <div class="inbox_people">
        <div class="headind_srch">
          <div class="recent_heading">
            <h4>Hỗ trợ</h4>
          </div>
        </div>
        <div class="inbox_chat" id="myDIV">
          @foreach ($customers as $customer)
          <div class="chat_list customerLink" style="cursor: pointer" data-customer-id="{{ $customer->id }}">
            <div class="chat_people align-items-center d-flex">
              <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="chat_ib ">
                <div class="d-flex justify-content-between">
                  <h5 class="mb-0">{{ $customer->name }}</h5>
                  <span id="unreadCount_{{ $customer->id }}" class="badge badge-danger align-items-center justify-content-center" style="display: {{ $customer->unreadCount > 0 ? 'flex' : 'none' }}">{{ $customer->unreadCount }}</span>
                </div>
                <div>{{ $customer->email }}</div>
              </div>
            </div>
          </div>
             
        </div>
      </div>
      <div class="mesgs">
        <div class="msg_history" id="chatMessages">
        </div>
        <form id="adminChatForm" class="type_msg" method="POST">
          @csrf
          <div class="input_msg_write">
            <input type="hidden" id="customerIdInput" name="customerId" value="">
            <input type="text" id="chatInput" name="message" autocomplete="off" class="write_msg" placeholder="Nhập tin nhắn" />
            <button class="msg_send_btn" type="submit"><i class="fa-regular fa-paper-plane-top"></i></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.6.1/socket.io.min.js" integrity="sha512-AI5A3zIoeRSEEX9z3Vyir8NqSMC1pY7r5h2cE+9J6FLsoEmSSGLFaqMQw8SWvoONXogkfFrkQiJfLeHLz3+HOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  function scrollToBottom() {
    let chatMessages = document.getElementById("chatMessages");
    chatMessages.scrollTop = chatMessages.scrollHeight;
  }

  let ip_address = '127.0.0.1';
  let socket_port = '3000';

  let socket = io.connect(ip_address + ':' + socket_port + '/admin');
  let currentCustomerId = null;

  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });

  function renderCustomerList(customers) {
    let inboxChat = $('#myDIV');
    inboxChat.empty();
    $.each(customers, function(index, customer) {
      let chatList = $('<div>').addClass('chat_list customerLink').attr('data-customer-id', customer.id).css('cursor', 'pointer');
      let chatPeople = $('<div>').addClass('chat_people align-items-center d-flex');
      let chatImg = $('<div>').addClass('chat_img').append($('<img>').attr('src', 'https://ptetutorials.com/images/user-profile.png').attr('alt', 'sunil'));
      let chatIb = $('<div>').addClass('chat_ib');
      let chatIbName = $('<div>').addClass('d-flex justify-content-between');
      let customerName = $('<h5>').addClass('mb-0').text(customer.name);
      let unreadBadge = $('<span>').attr('id', 'unreadCount_' + customer.id).addClass('badge badge-danger align-items-center justify-content-center').css('display', customer.unreadCount > 0 ? 'flex' : 'none').text(customer.unreadCount);
      let email = $('<div>').text(customer.email);
      chatIbName.append(customerName, unreadBadge);
      chatIb.append(chatIbName, email);
      chatPeople.append(chatImg, chatIb);
      chatList.append(chatPeople);
      inboxChat.append(chatList);
    });
  }

  function getCustomerList() {
    $.ajax({
      url: '/admin/contacts/get-customer-list', 
      method: 'GET', 
      dataType: 'json', 
      success: function(response) {
        let customers = response.customers;
        renderCustomerList(customers);
      }, 
      error: function(xhr, status, error) {
        console.log('Error retrieving customer list:', error);
      }
    });
  }

  function markMessagesAsRead(customerId) {
    $.ajax({
      url: '/admin/contacts/mark-message-as-read',
      method: 'POST',
      data: { customerId: customerId },
      success: function(response) {
        console.log('Đã đánh dấu tin nhắn là đã đọc.');
      },
      error: function(xhr, status, error) {
        console.log('Lỗi khi đánh dấu tin nhắn là đã đọc:', error);
      }
    });
  }
  function getUnreadMessageCounts() {
    $.ajax({
      url: '/admin/contacts/get-unread-message-counts',
      method: 'GET',
      dataType: 'json',
      success: function(response) {
        let unreadCounts = response.unreadCounts;
        // Lặp qua từng khách hàng và cập nhật số tin nhắn chưa đọc
        for (let customerId in unreadCounts) {
          let unreadCount = unreadCounts[customerId];
          let unreadCountElement = $('#unreadCount_' + customerId);
          unreadCountElement.text(unreadCount);
          unreadCountElement.css('display', unreadCount > 0 ? 'flex' : 'none');
          if (unreadCount > 0) {
            unreadCountElement.css('display', 'flex');
          } else {
            unreadCountElement.css('display', 'none');
          }
        }
      },
      error: function(xhr, status, error) {
        console.log('Error retrieving unread message counts:', error);
      }
    });
  }

  function getUnreadMessageCount(customerId) {
    $.ajax({
      url: '/admin/contacts/unread/' + customerId, 
      type: 'GET', 
      dataType: 'json', 
      success: function(response) {
        let unreadCountValue = response.unreadCount || 0;
        let unreadCountElement = $('#unreadCount_' + customerId);
        unreadCountElement.text(unreadCountValue);
        unreadCountElement.css('display', unreadCountValue > 0 ? 'flex' : 'none');
      }, 
      error: function(xhr, status, error) {
        console.log('Error retrieving unread message count:', error);
      }
    });
  }

  $(document).on('click','.customerLink',function(e) {
    e.preventDefault();
    let customerId = $(this).data('customer-id');
    markMessagesAsRead(customerId);
    $('#unreadCount_' + customerId).css('display', 'none');
    $('.customerLink').removeClass('active_chat');
    $(this).addClass('active_chat');
    currentCustomerId = customerId;
    $('#customerIdInput').val(customerId);
    socket.emit('selectCustomer', customerId);

    // Xóa các tin nhắn hiện tại
    $('#chatMessages').empty();

    $.ajax({
      url: '/admin/contacts/messages/' + customerId, 
      method: 'GET', 
      success: function(response) {
        let messages = response.messages;
        // Hiển thị tin nhắn từ cơ sở dữ liệu
        for (let i = 0; i < messages.length; i++) {
          let message = messages[i];
          let messageTime = new Date(message.created_at); // Thời gian tin nhắn

          if (message.sender === 'admin') {
            $('#chatMessages').append("<div class='outgoing_msg'><div class='sent_msg'><p>" + message.message + "</p><span class='time_date'>" + messageTime.toLocaleString() + "</span></div></div>");
          } else {
            $('#chatMessages').append("<div class='incoming_msg mb-2'><div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div> <div class='received_msg'><div class='received_withd_msg'><p>" + message.message + "</p><span class='time_date'>" + messageTime.toLocaleString() + "</span></div> </div></div>");
          }
        }
        scrollToBottom();
      }, 
      error: function(xhr, status, error) {
        console.log('Error retrieving messages:', error);
      }
    });
  });

  $('#adminChatForm').submit(function(e) {
    markMessagesAsRead(currentCustomerId);
    e.preventDefault();
    let message = $('#chatInput').val();
    if (currentCustomerId) {
      socket.emit('adminSendMessage', {
        customerId: currentCustomerId, 
        message: message
      });
      $.post('/admin/contacts/send-message', {
        customerId: currentCustomerId, 
        message: message
      });
      $('#chatInput').val('');
      $('#chatMessages').append("<div class='outgoing_msg'><div class='sent_msg'><p>" + message + "</p><span class='time_date'>" + new Date().toLocaleString() + "</span></div></div>");
      scrollToBottom();
    } else {
      alert('Vui lòng chọn một khách hàng để trò chuyện.');
    }
  });

  socket.on('customerMessage', function(data) {
    // console.log(data);
    getUnreadMessageCount(data.customerId);
    getUnreadMessageCounts();
    getCustomerList();
    if (data.customerId == currentCustomerId) {
      $('#chatMessages').append("<div class='incoming_msg mb-2'><div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div> <div class='received_msg'><div class='received_withd_msg'><p>" + data.message + "</p><span class='time_date'>" + new Date().toLocaleString() + "</span></div> </div></div>");
      scrollToBottom();
    }
  });

</script>
@endsection
