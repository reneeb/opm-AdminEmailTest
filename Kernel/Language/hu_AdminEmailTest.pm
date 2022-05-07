# --
# Kernel/Language/hu_AdminEmailTest.pm - the Hungarian translation of AdminEmailTest
# Copyright (C) 2016 - 2022 Perl-Services.de, https://www.perl-services.de/
# Copyright (C) 2016 Balázs Úr, http://www.otrs-megoldasok.hu/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu_AdminEmailTest;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation} || {};

    # Custom/Kernel/Output/HTML/Templates/Standard/AdminEmailTest.tt
    $Lang->{'Email Test'} = 'E-mail teszt';
    $Lang->{'Hint'} = 'Tipp';
    $Lang->{'Here you can paste emails to push them in to the system.'} =
        'Itt illeszthet be e-maileket a rendszerbe való beküldéshez.';
    $Lang->{'Options'} = 'Beállítások';
    $Lang->{'Email'} = 'E-mail';
    $Lang->{'This field is required.'} = 'Ez a mező kötelező.';
    $Lang->{'Submit Mail'} = 'Levél beküldése';

    # Kernel/Config/Files/AdminEmailTest.xml
    $Lang->{'Frontend module registration for the agent interface.'} =
        'Előtétprogram-modul regisztráció az ügyintézői felülethez.';
    $Lang->{'This module is part of the admin area of OTRS.'} =
        'Ez a modul az OTRS adminisztrációs területének a része.';
    $Lang->{'Paste emails to test the postmaster.'} = 'E-mailek beillesztése a levelezés teszteléséhez.';
}

1;
