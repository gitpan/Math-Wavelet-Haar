# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Wavelet-Haar.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 4;
BEGIN { use_ok('Math::Wavelet::Haar') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @test = qw(1 2 3 4 5 6 7 8);
my $result = [decomp1D(@test)];
my $expected = [36, -16, -4, -4, -1, -1, -1, -1];
is_deeply($result, $expected, "Haar 1D 1");

@test = qw(1 1 1 1 1 1 1 1);
$result = [decomp1D(@test)];
$expected = [8, 0, 0, 0, 0, 0, 0, 0];
is_deeply($result, $expected, "Haar 1D 2");

@test = ([0,1,2,3],[1,2,3,4],[2,3,4,5],[3,4,5,6]);
$expected = [[48,-16,-4,-4],[-16,0,0,0],[-4,0,0,0],[-4,0,0,0]];
$result = [decomp2D(@test)];
is_deeply($result, $expected, "Haar 2D 1");