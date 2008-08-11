# $Id: /mirror/coderepos/lang/perl/Acme-Mahjong/trunk/lib/Acme/Mahjong/Rule.pm 68220 2008-08-11T08:15:08.113200Z daisuke  $

package Acme::Mahjong::Rule;
use Moose::Role;
use Acme::Mahjong::Hand;
use Acme::Mahjong::Deck;

requires qw(calculate);

no Moose;

sub hand_create {
    return Acme::Mahjong::Hand->new;
}

sub deck_create {
    return Acme::Mahjong::Deck->new;
}

1;