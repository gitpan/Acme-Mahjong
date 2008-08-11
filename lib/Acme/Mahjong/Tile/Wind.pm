# $Id: /mirror/coderepos/lang/perl/Acme-Mahjong/trunk/lib/Acme/Mahjong/Tile/Wind.pm 68223 2008-08-11T08:22:46.959261Z daisuke  $

package Acme::Mahjong::Tile::Wind;
use Moose;
use Moose::Util::TypeConstraints;

with 'Acme::Mahjong::Tile';

has 'label' => (
    is => 'ro',
    isa => enum( [ qw( EAST SOUTH WEST NORTH ) ] ),
    required => 1,
);

no Moose;

1;