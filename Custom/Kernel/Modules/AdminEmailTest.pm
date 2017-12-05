# --
# Copyright (C) 2015 - 2017  Perl-Services.de, http://perl-services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminEmailTest;
## nofilter(TidyAll::Plugin::OTRS::Perl::DBObject)

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    # secure mode message (don't allow this action until secure mode is enabled)
    if ( !$ConfigObject->Get('SecureMode') ) {
        return $LayoutObject->SecureMode();
    }

    # ------------------------------------------------------------ #
    # do select
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Test' ) {
        my %Errors;

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # get params
        for my $Parameter ( qw(Email) ) {
            $Param{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        if ( !$Param{Email} ) {
            $Errors{EmailInvalid} = 'ServerError';
            $Errors{ErrorType}  = 'FieldRequired';
        }

        # if no errors occurred
        if ( !%Errors ) {
            my @Email = split /\x0d?\x0a/, $Param{Email};

            my $CommunicationLogObject = $Kernel::OM->Create(
                'Kernel::System::CommunicationLog',
                ObjectParams => {
                    Transport   => 'Email',
                    Direction   => 'Incoming',
                    AccountType => 'AdminInterface',
                    AccountID   => 1,
                },
            );

            $CommunicationLogObject->ObjectLogStart( ObjectLogType => 'Message' );

            eval {
                my %ObjectParams = (
                    ObjectParams => {
                        Email                  => \@Email,
                        Trusted                => 1,
                        CommunicationLogObject => $CommunicationLogObject,
                    },
                );

                my $Object = $Kernel::OM->Create('Kernel::System::PostMaster', %ObjectParams );
                $Object->Run();
            };

            $CommunicationLogObject->CommunicationStop(
                Status => 'Successful',
            );
        }
        else {

            # add server error message block
            $LayoutObject->Block( Name => $Errors{ErrorType} . 'ServerError' );
        }

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Notify(
            Info     => $Errors{ErrorMessage},
            Priority => 'Error'
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminEmailTest',
            Data         => {
                %Param,
                %Errors,
            },
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # print form
    # ------------------------------------------------------------ #
    else {

        # get params
        $Param{Email} = $ParamObject->GetParam( Param => 'Email' );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminEmailTest',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
}

1;
