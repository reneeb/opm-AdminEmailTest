# --
# Kernel/Language/de_AdminEmailTest.pm - the German translation of AdminEmailTest
# Copyright (C) 2016 Perl-Services.de, http://perl-services.de/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_AdminEmailTest;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation} || {};

    # Custom/Kernel/Output/HTML/Templates/Standard/AdminEmailTest.tt
    $Lang->{'Email Test'} = '';
    $Lang->{'Hint'} = 'Hinweis';
    $Lang->{'Here you can paste emails to push them in to the system.'} = '';
    $Lang->{'Options'} = 'Optionen';
    $Lang->{'Email'} = 'E-Mail';
    $Lang->{'This field is required.'} = 'Dieses Feld wird benötigt.';
    $Lang->{'Submit Mail'} = '';

    # Kernel/Config/Files/AdminEmailTest.xml
    $Lang->{'Frontend module registration for the agent interface.'} =
        'Frontend-Modulregistrierung im Agent-Interface.';
    $Lang->{'This module is part of the admin area of OTRS.'} = '';
    $Lang->{'Paste emails to test the postmaster.'} = '';
}

1;
