#!/usr/bin/perl
=head1 NAME

pbkdf2 - generate a cryptographic hash of some text

=head1 SYNOPSIS

  pbkdf2.pl salt_hex  iterative_count < password > hex_key_and_iv

OR

  require "pbkdf2.pl";
  $key = pbkdf2( $password, $salt, $iter, $keylen, $prf)

  # $iter is number of iterations
  # $keylen is length of generated key in bytes
  # $prf is the pseudo random function (e.g. hmac_sha1)
  # returns the key.

=head1 DESCRIPTION

Direct Perl Implementation of pbkdf2 iterative hashing function

=head1 AUTHORS

Initial function  Jochen Hoenicke <hoenicke@gmail.com> from the
Palm::Keyring perl module.  Found on the PerlMonks Forum
http://www.perlmonks.org/?node_id=631963

Modulized   2 Sept 2010   Anthony Thyssen

=cut

# Usage pbkdf2(password, salt, iter, keylen, prf)
sub pbkdf2($$$$$)
{
    my ($password, $salt, $iter, $keylen, $prf) = @_;
    my ($k, $t, $u, $ui, $i);
    $t = "";
    for ($k = 1; length($t) <  $keylen; $k++) {
    $u = $ui = &$prf($salt.pack('N', $k), $password);
    for ($i = 1; $i < $iter; $i++) {
        $ui = &$prf($ui, $password);
        $u ^= $ui;
    }
    $t .= $u;
    }
    return substr($t, 0, $keylen);
}


#
# Direct call of module as a program..
#
# pbkdf2.pl salt_hex  iterative_count < password > hex_key_and_iv
#
if (!caller) {

  require Digest::HMAC_SHA1;
  import  Digest::HMAC_SHA1 qw(hmac_sha1);

  my $salt =  pack("H*",shift);   # salt from hex input
  my $ic = shift;                 # iterative count

  my $password = <STDIN>;
  $password =~ s/\n$//;

  my $key = pbkdf2($password, $salt, $ic, 32+16, \&hmac_sha1);

  print unpack("H*",$key), "\n";  # output key as hexadecimal

  exit 0;
}
1;

