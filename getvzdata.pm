#!/usr/bin/perl
package getvzdata;

use strict;
use warnings;

sub strom {
use LWP::Simple;
# Following module need an installation on the system. User terminal:
# sudo cpan JSON::Parse
use JSON;
use Data::Dumper;

#Nicht benötigt
#my $time=time;


#http get in LWP:Simple Bsp:
#$content_json = get("http://www.sn.no/");
#die "Couldn't get it!" unless defined $content_json;
 
 #Syntax for http-get volkszaehler in der Referenz
 #http://wiki.volkszaehler.org/development/api/reference
 #Beispiel für Config
 #$content_json = get("http://heizung.chroszewski.de/middleware.php/data/a301d8d0-903b-1234-94bb-d943d061b6a8.json?from=now");

my $frontend_http = 'http://heizung.chroszewski.de/middleware.php/data/';
my $uuid = 'a301d8d0-903b-1234-94bb-d943d061b6a8';

#my $http_get = $frontend_http.$uuid.".json?from=now";
my $http_get = $frontend_http.$uuid.".json?from=today&tuples=24";

#print "$http_get\n";
my $content_json = get($http_get);
 die "Couldn't get it!" unless defined $content_json;

my $text = decode_json($content_json);
# Only for debugging:
#print "$content_json\n";
#print Dumper($text);

print "Max:         " . $text->{data}{max}[1], "\n";
print "Min:         " . $text->{data}{min}[1], "\n";
print "Average:     " . $text->{data}{average}, "\n";
print "Comsumption: " . $text->{data}{consumption}, "\n";
}
1; #Give back true value
