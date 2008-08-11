use strict;
use inc::Module::Install;

name('Acme-Mahjong');
all_from('lib/Acme/Mahjong.pm');

requires 'Moose';
requires 'List::Util';

auto_include;
WriteAll;