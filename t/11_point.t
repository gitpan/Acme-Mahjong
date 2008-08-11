use strict;
use Test::More (tests => 4 );

BEGIN
{
    use_ok("Acme::Mahjong::Rule::JP");
}

{
    my $rule = Acme::Mahjong::Rule::JP->new();

    my @patterns = (
        { fu => 37, han => 3, score => 5200 },
        { fu => 71, han => 3, score => 8000 },
        { fu =>  0, han => 5, score => 8000 },
    );

    foreach my $data (@patterns) {
        is( $rule->fu2point( %$data ), $data->{score} );
    }
}
