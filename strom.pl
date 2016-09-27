#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
# Following module need an installation on the system. User terminal:
# sudo cpan JSON::Parse
use JSON;
use Data::Dumper;

my $time=time;


#http get in LWP:Simple Bsp:
#$content_json = get("http://www.sn.no/");
#die "Couldn't get it!" unless defined $content_json;
 
 #Syntax for http-get volkszaehler in der Referenz
 #http://wiki.volkszaehler.org/development/api/reference
 #Beispiel für Config
 #$content_json = get("http://heizung.chroszewski.de/middleware.php/data/a301d8d0-903b-1234-94bb-d943d061b6a8.json?from=now");

 my $frontend_http = 'http://heizung.chroszewski.de/middleware.php/data/';
 my $uuid = 'a301d8d0-903b-1234-94bb-d943d061b6a8';

my $http_get = $frontend_http.$uuid.".json?from=$time";
#print "$http_get\n";
my $content_json = get($http_get);
 die "Couldn't get it!" unless defined $content_json;

print "$content_json\n";
 
my $text = decode_json($content_json);
print Dumper($text);

print $text->{data}{consumption}, "\n";

