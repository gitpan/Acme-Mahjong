# $Id: /mirror/coderepos/lang/perl/Acme-Mahjong/trunk/lib/Acme/Mahjong/Tile/Dragon.pm 68208 2008-08-11T07:16:52.573858Z daisuke  $

package Acme::Mahjong::Tile::Dragon;
use Moose;
use Moose::Util::TypeConstraints;

with 'Acme::Mahjong::Tile';

has 'label' => (
    is => 'ro',
    isa => enum( [ qw( RED GREEN WHITE ) ] ),
    required => 1
);

no Moose;

1;