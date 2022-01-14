import socket

UDP_IP = "46.140.108.210"
UDP_PORT = 5060
MESSAGE1 = "Hello, World! 1 send "
MESSAGE2 = "Hello, World! 2 send "
MESSAGE3 = "Hello, World! 3 send "
MESSAGE4 = "Hello, World! 4 send "

print "UDP target IP:", UDP_IP
print "UDP target port:", UDP_PORT

sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE1, (UDP_IP, UDP_PORT))
sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE2, (UDP_IP, UDP_PORT))
sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE3, (UDP_IP, UDP_PORT))
sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE4, (UDP_IP, UDP_PORT))
