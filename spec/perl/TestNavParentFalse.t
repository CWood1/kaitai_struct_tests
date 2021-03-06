# Autogenerated from KST: please remove this line if doing any edits by hand!

package spec::perl::TestNavParentFalse;

use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use NavParentFalse;

sub test_nav_parent_false: Test(5) {
    my $r = NavParentFalse->from_file('src/nav_parent_codes.bin');

    is($r->child_size(), 3, 'Equals');
    is($r->element_a()->foo()->code(), 73, 'Equals');
    is($r->element_a()->foo()->more(), pack('C*', (49, 50, 51)), 'Equals');
    is($r->element_a()->bar()->foo()->code(), 66, 'Equals');
    is($r->element_b()->foo()->code(), 98, 'Equals');
}

Test::Class->runtests;
