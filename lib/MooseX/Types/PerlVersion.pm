package MooseX::Types::PerlVersion;

# ABSTRACT: L<Perl::Version> type for Moose classes

use strict;
use warnings;

use Perl::Version; our $VERSION = Perl::Version->new('v0.1.0');

use MooseX::Types -declare => [qw(PerlVersion)];
use MooseX::Types::Moose qw(Num Str);
use namespace::clean;

class_type 'Perl::Version';

subtype PerlVersion,
    as 'Perl::Version',
    where { $_ =~ Perl::Version::REGEX },
    message { 'Must be a valid Perl version' };

coerce PerlVersion,
    from Num, via { Perl::Version->new($_) },
    from Str, via { Perl::Version->new($_) };

1; # eof

__END__
=pod

=head1 SYNOPSIS

  use MooseX::Types::PerlVersion qw(PerlVersion);

  has version => (
      is     => 'ro',
      isa    => PerlVersion,
      coerce => 1,
  );

=head1 DESCRIPTION

This package provides Moose types for L<Perl::Version>. It also provides
coercion from C<Str> and C<Num> Moose types.

=head1 EXPORT

None by default, you'll usually want to request C<PerlVersion> explicitly.

=head1 SEE ALSO

=over 4

=item L<Perl::Version>

=item L<Moose::Util::TypeConstraints>

=item L<Moose>

=back

=cut