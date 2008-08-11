# $Id: /mirror/coderepos/lang/perl/Acme-Mahjong/trunk/lib/Acme/Mahjong/Rule/JP.pm 68239 2008-08-11T10:58:46.672869Z daisuke  $

package Acme::Mahjong::Rule::JP;
use Moose;

with 'Acme::Mahjong::Rule';

no Moose;

my $FU_MAP_CHILD = [ 
    #   20    30    40    50    60    70    80    90   100   110
    [    0, 1000, 1300, 1600, 2000, 2300, 2600, 2900, 3200, 3600, ],
    [ 1300, 2000, 2600, 3200, 3900, 4500, 5200, 5800, 6400, 7100, ],
    [ 2600, 3900, 5200, 6400, 7700,  ],
    [ 5200, 7700 ]
];

my $FU_MAP_PARENT = [ 
    #   20     30    40    50     60    70    80    90   100    110
    [    0,  1500, 2000, 2400,  2900, 3400, 3900, 4400, 4800,  5300, ],
    [ 2000,  2900, 3900, 4800,  5800, 6800, 7700, 8700, 9600, 10600, ],
    [ 3900,  5800, 7700, 9600, 11600,  ],
    [ 7700, 11600 ]
];

# dummy
sub is_buta { 0 }

sub fu2point_table {
    my ($self, %args) = @_;

    my $fu = $args{fu};
    my $han = $args{han};
    my $map = $args{oya} ? $FU_MAP_PARENT : $FU_MAP_CHILD;

    return $map->[ $han - 1 ]->[ ($fu / 10) - 1 ];

}

sub calculate {
    my ($self, %args) = @_;

    return 0 if $self->is_buta(%args);
    return $self->fu2point(%args);
}

sub fu2point {
    my ($self, %args) = @_;

    my $fu = $args{fu};
    my $han = $args{han};

    if (my $r = $fu % 10) {
        $fu -= $r;
        $fu += 10;
    }

    if ($han < 3) {
        return $self->fu2point_table( fu => $fu, han => $han, %args );
    } elsif ($han == 3) {
        if ($fu > 60) {
            $han += 2;
        } else {
            return $self->fu2point_table( fu => $fu, han => $han, %args );
        }
    } elsif ($han == 4) {
        if ($fu > 30) {
            $han++;
        } else {
            return $self->fu2point_table( fu => $fu, han => $han, %args );
        }
    }

    # 満貫以降の点数計算は比較的シンプル
    my $score = 0;
    if ($han == 5) {
        $score = 8000;
    } elsif ($han <= 7) {
        $score = 12000;
    } elsif ($han <= 10) {
        $score = 16000;
    } elsif ($han <= 12) {
        $score = 24000;
    } else {
        $score = 32000;
    }

    if ($args{oya}) {
        $score *= 1.5;
    }

    return $score;
}

1;

__END__

=head1 NAME

Acme::Mahjong::Rule::JP - A Generic Rule For Japan

=cut