const { log } = require('console');
const express = require('express');
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server, {
  cors: { origin: "*" }
});

const adminNamespace = io.of('/admin');
const customerNamespace = io.of('/');

adminNamespace.on('connection', (socket) => {
  console.log('Admin connected');

  socket.on('selectCustomer', (customerId) => {
    console.log('Selected customer:', customerId);
    socket.customerId = customerId;
    customerNamespace.to(customerId).emit('adminConnected', socket.id); // Gửi sự kiện 'adminConnected' tới customer đã chọn
  });

  socket.on('adminSendMessage', (data) => {
    const { customerId, message } = data;
    console.log('Admin sent message:', message);
    // const adminId = socket.id;
    customerNamespace.to("chat " + customerId).emit('adminMessage', { customerId: customerId, message: message });
    socket.emit('adminMessage', { customerId: customerId, message: message });
  });

  socket.on('disconnect', () => {
    console.log('Admin disconnected');
    const customerId = socket.customerId;
    customerNamespace.to(customerId).emit('adminDisconnected'); // Gửi sự kiện 'adminDisconnected' tới customer đã chọn khi admin ngắt kết nối
  });
});

customerNamespace.on('connection', (socket) => {
  console.log('Customer connected');
  socket.on('joinroom', (room) => {
    console.log('Join room',room);
    socket.join(room);
  })
  socket.on('customerSendMessage', (data) => {
    const { customerId, message } = data;
    console.log('Customer sent message:', message);
    adminNamespace.emit('customerMessage', { customerId: customerId, message: message });
    socket.emit('customerMessage', { customerId: customerId, message: message });
  });
  socket.on('adminConnected', (adminId) => {
    socket.adminId = adminId; // Lưu adminId vào socket của customer để sử dụng trong sự kiện customerSendMessage
  });
  socket.on('disconnect', () => {
    console.log('Customer disconnected');
    adminNamespace.emit('customerDisconnected', socket.id); // Gửi sự kiện 'customerDisconnected' tới tất cả admin khi customer ngắt kết nối
  });
  
});

server.listen(3000, () => {
  console.log('Server is running');
});