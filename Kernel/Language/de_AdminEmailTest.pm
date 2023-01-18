# --
# Kernel/Language/de_AdminEmailTest.pm - the German translation of AdminEmailTest
# Copyright (C) 2016 - 2023 Perl-Services.de, https://www.perl-services.de/
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
    $Lang->{'Email Test'} = 'E-Mail Test';
    $Lang->{'Hint'} = 'Hinweis';
    $Lang->{'Here you can paste emails to push them in to the system.'} = 'Hier können Sie E-Mails kopieren um Sie in das OTRS einzuspielen.';
    $Lang->{'Options'} = 'Optionen';
    $Lang->{'Email'} = 'E-Mail';
    $Lang->{'This field is required.'} = 'Dieses Feld wird benötigt.';
    $Lang->{'Submit Mail'} = 'Mail abschicken';

    # Kernel/Config/Files/AdminEmailTest.xml
    $Lang->{'Frontend module registration for the agent interface.'} =
        'Frontend-Modulregistrierung im Agent-Interface.';
    $Lang->{'This module is part of the admin area of OTRS.'} = 'Dieses Modul ist Teil des OTRS Adminbereichs.';
    $Lang->{'Paste emails to test the postmaster.'} = 'Kopiere Mails um den Postmaster zu testen';
}

1;
