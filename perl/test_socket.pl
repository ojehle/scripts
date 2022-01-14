#!/usr/bin/perl

use IO::Socket::INET;
my ($socket,$client_socket);
$num_args = $#ARGV + 1;

if ($num_args != 2) {
    print "\nUsage: test_socket.pl host port\n";
    exit 1;
}
 
$host=$ARGV[0];
$port=$ARGV[1];

$socket = new IO::Socket::INET (
PeerHost => $host,
PeerPort => $port,
Proto => 'tcp',
) or exit 1;

exit 0
