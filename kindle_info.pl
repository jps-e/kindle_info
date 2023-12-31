#!/usr/bin/env perl
use strict;
use warnings;

my ($model, $nicks, $notes, $prefix, $info, $y, $week, $day, $l, $key, $nm, $ss);
my $sn = shift @ARGV;
$sn =~ s/-//g; $sn =~ s/ //g;
my $lines = <<'EOD';
B001	Kindle 1                                                     K1
B101	Kindle 1                                                     K1
B002	Kindle 2 U.S. (Sprint)                                       K2
B003	Kindle 2 International (AT&T)                                K2, K2I
B004	Kindle DX U.S.                                               DX
B005	Kindle DX International                                      DX, DXI
B009	Kindle DX Graphite                                           DXG
B008	Kindle 3 WiFi                                                K3, K3W
B006	Kindle 3 3G + WiFi (U.S. and Canada)                         K3, K3G         NOTE: Some European customers may receive this model as well.
B00A	Kindle 3 3G + WiFi (Europe)                                  K3, K3GB
B00C	Kindle PaperWhite not for sale (FOR TESTERS)
B00E	Kindle 4 NoTouch Silver (2011)                               K4, K4S
B00F	Kindle Touch 3G + WiFi (Kindle 5) (U.S. and Canada) [Mostly] K5, KT
B011	Kindle Touch WiFi (Kindle 5)                                 K5, KT, K5W
B010	Kindle Touch 3G + WiFi (Kindle 5) (Europe)                   K5, KT, K5G
B012	Kindle 5 (Unknown)                                           K5              If you happen to get your hands on one of these, please enlighten us!
B023	Kindle 4 NoTouch Black (2012)                                K4, K4B         [Support added in KindleTool 1.5.1]
9023	Kindle 4 NoTouch Black (2012)                                K4, K4B         [Support added in KindleTool 1.5.1]
B024	Kindle PaperWhite WiFi                                       PW              [Support added in KindleTool 1.5.3]
B01B	Kindle PaperWhite 3G + WiFi (U.S.) [Mostly]                  PW, PWG         [Support added in KindleTool 1.5.3]
B020	Kindle PaperWhite 3G + WiFi (Brazil)                         PW, PWBR        [Support added in KindleTool 1.5.8]
B01C	Kindle PaperWhite 3G + WiFi (Canada)                         PW, PWC         [Support added in KindleTool 1.5.7]
B01D	Kindle PaperWhite 3G + WiFi (Europe)                         PW, PWGB        [Support added in KindleTool 1.5.4]
B01F	Kindle PaperWhite 3G + WiFi (Japan)                          PW, PWJ         [Support added in KindleTool 1.5.6]
B0D4	Kindle PaperWhite 2 (2013) WiFi (U.S., Intl.)                PW2             [Support added in KindleTool 1.6.0]
90D4	Kindle PaperWhite 2 (2013) WiFi (U.S., Intl.)                PW2             [Support added in KindleTool 1.6.0]
B05A	Kindle PaperWhite 2 (2013) WiFi (Japan)                      PW2, PW2J       [Support added in KindleTool 1.6.0]
905A	Kindle PaperWhite 2 (2013) WiFi (Japan)                      PW2, PW2J       [Support added in KindleTool 1.6.0]
B0D5	Kindle PaperWhite 2 (2013) 3G + WiFi (U.S.) [Mostly]         PW2, PW2G       [Support added in KindleTool 1.6.0]
90D5	Kindle PaperWhite 2 (2013) 3G + WiFi (U.S.) [Mostly]         PW2, PW2G       [Support added in KindleTool 1.6.0]
B0D6	Kindle PaperWhite 2 (2013) 3G + WiFi (Canada]                PW2, PW2GC      [Support added in KindleTool 1.6.2]
90D6	Kindle PaperWhite 2 (2013) 3G + WiFi (Canada]                PW2, PW2GC      [Support added in KindleTool 1.6.2]
B0D7	Kindle PaperWhite 2 (2013) 3G + WiFi (Europe)                PW2, PW2GB      [Support added in KindleTool 1.6.0]
90D7	Kindle PaperWhite 2 (2013) 3G + WiFi (Europe)                PW2, PW2GB      [Support added in KindleTool 1.6.0]
B0D8	Kindle PaperWhite 2 (2013) 3G + WiFi (Russia)                PW2, PW2GR      [Support added in KindleTool 1.6.0]
90D8	Kindle PaperWhite 2 (2013) 3G + WiFi (Russia)                PW2, PW2GR      [Support added in KindleTool 1.6.0]
B0F2	Kindle PaperWhite 2 (2013) 3G + WiFi (Japan)                 PW2, PW2GJ      [Support added in KindleTool 1.6.0]
90F2	Kindle PaperWhite 2 (2013) 3G + WiFi (Japan)                 PW2, PW2GJ      [Support added in KindleTool 1.6.0]
B017	Kindle PaperWhite 2 (2013) WiFi (4GB) (U.S., Intl.)          PW2, PW2IL      [Support added in KindleTool 1.6.3]
9017	Kindle PaperWhite 2 (2013) WiFi (4GB) (U.S., Intl.)          PW2, PW2IL      [Support added in KindleTool 1.6.3]
B060	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (Europe)          PW2, PW2GBL     [Support added in KindleTool 1.6.3]
9060	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (Europe)          PW2, PW2GBL     [Support added in KindleTool 1.6.3]
B062	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (U.S.) [Mostly]   PW2, PW2GL      [Support added in KindleTool 1.6.3]
9062	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (U.S.) [Mostly]   PW2, PW2GL      [Support added in KindleTool 1.6.3]
B05F	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (Canada)          PW2, PW2GCL     [Support added in KindleTool 1.6.4]
905F	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (Canada)          PW2, PW2GCL     [Support added in KindleTool 1.6.4]
B061	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (Brazil)          PW2, PW2GBRL    [Support added in KindleTool 1.6.5]
9061	Kindle PaperWhite 2 (2013) 3G + WiFi (4GB) (Brazil)          PW2, PW2GBRL    [Support added in KindleTool 1.6.5]
B0C6	Kindle Basic (2014)                                          KT2, BASIC      [Support added in KindleTool 1.6.3]
90C6	Kindle Basic (2014)                                          KT2, BASIC      [Support added in KindleTool 1.6.3]
B0DD	Kindle Basic (2014) (Australia)                              KT2, BASIC      [Support added in KindleTool 1.6.5]
90DD	Kindle Basic (2014) (Australia)                              KT2, BASIC      [Support added in KindleTool 1.6.5]
B013	Kindle Voyage WiFi                                           KV              [Support added in KindleTool 1.6.4]
9013	Kindle Voyage WiFi                                           KV              [Support added in KindleTool 1.6.4]
B054	Kindle Voyage 3G + WiFi (U.S.)                               KV, KVG         [Support added in KindleTool 1.6.4]
9054	Kindle Voyage 3G + WiFi (U.S.)                               KV, KVG         [Support added in KindleTool 1.6.4]
B053	Kindle Voyage 3G + WiFi (Europe)                             KV, KVGB        [Support added in KindleTool 1.6.4]
9053	Kindle Voyage 3G + WiFi (Europe)                             KV, KVGB        [Support added in KindleTool 1.6.4]
B02A	Kindle Voyage 3G + WiFi (Japan)                              KV, KVGJ        [Support added in KindleTool 1.6.5]
B052	Kindle Voyage 3G + WiFi (Mexico)                             KV, KVGM        [Support added in KindleTool 1.6.5]
9052	Kindle Voyage 3G + WiFi (Mexico)                             KV, KVGM        [Support added in KindleTool 1.6.5]
G090G1	Kindle PaperWhite 3 (2015) WiFi                              PW3             [Support added in KindleTool 1.6.5]
G090G2	Kindle PaperWhite 3 (2015) 3G + WiFi (U.S.) [Mostly]         PW3, PW3G       [Support added in KindleTool 1.6.5]
G090G4	Kindle PaperWhite 3 (2015) 3G + WiFi (Mexico)                PW3, PW3GM      [Support added in KindleTool 1.6.5]
G090G5	Kindle PaperWhite 3 (2015) 3G + WiFi (Europe, Australia)     PW3, PW3GB      [Support added in KindleTool 1.6.5]
G090G6	Kindle PaperWhite 3 (2015) 3G + WiFi (Canada)                PW3, PW3GC      [Support added in KindleTool 1.6.5]
G090G7	Kindle PaperWhite 3 (2015) 3G + WiFi (Japan)                 PW3, PW3GJ      [Support added in KindleTool 1.6.5]
G090KB	White Kindle PaperWhite 3 (2015) WiFi                        PW3W            [Support added in KindleTool 1.6.5]
G090KC	White Kindle PaperWhite 3 (2015) 3G + WiFi (Japan)           PW3W, PW3WGJ    [Support added in KindleTool 1.6.5]
G090KE	White Kindle PaperWhite 3 (2016) 3G + WiFi (International)   PW3W, PW3WGI    [Support added in KindleTool 1.6.5]
G090KF	White Kindle PaperWhite 3 (2016) 3G + WiFi (International)   PW3W, PW3WGIB   [Support added in KindleTool 1.6.5]
G090LK	Kindle PaperWhite 3 (2016) WiFi, 32GB (Japan)                PW3-32B, PW3JL  [Support added in KindleTool 1.6.5]
G090LL	White Kindle PaperWhite 3 (2016) WiFi, 32GB (Japan)          PW3-32W, PW3WJL [Support added in KindleTool 1.6.5]
G0B0GC	Kindle Oasis WiFi                                            KOA             [Support added in KindleTool 1.6.5]
G0B0GD	Kindle Oasis 3G + WiFi (U.S.) [Mostly]                       KOA, KOAG       [Support added in KindleTool 1.6.5]
G0B0GR	Kindle Oasis 3G + WiFi (International)                       KOA, KOAGI      [Support added in KindleTool 1.6.5]
G0B0GU	Kindle Oasis 3G + WiFi (Europe)                              KOA, KOAGB      [Support added in KindleTool 1.6.5]
G0B0GT	Kindle Oasis 3G + WiFi (China)                               KOA, KOAGCN     [Support added in KindleTool 1.6.6]
G000K9	Kindle Basic 2 (2016)                                        KT3             [Support added in KindleTool 1.6.5]
G000KA	White Kindle Basic 2 (2016)                                  KT3, KT3W       [Support added in KindleTool 1.6.5]
G000P8	Kindle Oasis 2 (2017) WiFi 8GB (Germany, Italy, USA)         KOA2, KOA2W8    [Support added in KindleTool 1.6.5]
G000S1	Kindle Oasis 2 (2017) WiFi+3G 32GB (USA)                     KOA2, KOA2G32   [Support added in KindleTool 1.6.5]
G000SA	Kindle Oasis 2 (2017) WiFi 32GB (Japan, Italy, UK, USA)      KOA2, KOA2W32   [Support added in KindleTool 1.6.5]
G000S2	Kindle Oasis 2 (2017) WiFi+3G 32GB (Europe)                  KOA2, KOA2G32B  [Support added in KindleTool 1.6.5]
G000P1	Champagne Kindle Oasis 2 (2017) WiFi 32GB                    KOA2, KOA2W32C  [Support added in KindleTool 1.7.0]
G000PP	Kindle PaperWhite 4 (2018) WiFi, 8GB                         PW4             [Support added in KindleTool 1.6.6]
G8S0PP	Kindle PaperWhite 4 (2018) WiFi, 8GB                         PW4             [Support added in KindleTool 1.6.6]
G000T6	Kindle PaperWhite 4 (2018) WiFi, 32GB                        PW4-32, PW4L    [Support added in KindleTool 1.6.6]
G8S0T6	Kindle PaperWhite 4 (2018) WiFi, 32GB                        PW4-32, PW4L    [Support added in KindleTool 1.6.6]
G000T1	Kindle PaperWhite 4 (2018) WiFi+4G, 32GB                     PW4-32, PW4LG   [Support added in KindleTool 1.6.6]
G000T2	Kindle PaperWhite 4 (2018) WiFi+4G, 32GB (Europe)            PW4-32, PW4LGB  [Support added in KindleTool 1.6.6]
G00102	Kindle PaperWhite 4 (2018) WiFi, 8GB (India)                 PW4, PW4IN      [Support added in KindleTool 1.7.0]
G000T3	Kindle PaperWhite 4 (2018) WiFi+4G, 32GB (Japan)             PW4-32, PW4LGJP [Support added in KindleTool 1.7.0]
G0016T	Twilight Blue Kindle PaperWhite 4 (2018) WiFi, 8GB           PW4, PW4TB      [Support added in KindleTool 1.7.0]
G8S16T	Twilight Blue Kindle PaperWhite 4 (2018) WiFi, 8GB           PW4, PW4TB      [Support added in KindleTool 1.7.0]
G0016Q	Twilight Blue Kindle PaperWhite 4 (2018) WiFi, 32GB          PW4, PW4LTB     [Support added in KindleTool 1.7.0]
G8S16Q	Twilight Blue Kindle PaperWhite 4 (2018) WiFi, 32GB          PW4, PW4LTB     [Support added in KindleTool 1.7.0]
G0016U	Plum Kindle PaperWhite 4 (2018) WiFi, 8GB                    PW4, PW4P       [Support added in KindleTool 1.7.0]
G0016V	Sage Kindle PaperWhite 4 (2018) WiFi, 8GB                    PW4, PW4S       [Support added in KindleTool 1.7.0]
G8S16V	Sage Kindle PaperWhite 4 (2018) WiFi, 8GB                    PW4, PW4S       [Support added in KindleTool 1.7.0]
G00103	Kindle PaperWhite 4 (2018) WiFi, 32GB (India)                PW4, PW4LIN     [Support added in KindleTool 1.7.0]
G0016R	Plum Kindle PaperWhite 4 (2018) WiFi, 32GB                   PW4, PW4LP      [Support added in KindleTool 1.7.0]
G0016S	Sage Kindle PaperWhite 4 (2018) WiFi, 32GB                   PW4, PW4LS      [Support added in KindleTool 1.7.0]
G0910L	Kindle Basic 3 (2019)                                        KT4             [Support added in KindleTool 1.7.0]
G090WH	White Kindle Basic 3 (2019)                                  KT4, KT4W       [Support added in KindleTool 1.7.0]
G090VB	Kindle Basic 3 (2019) Kids Edition                           KT4, KT4KE      [Support added in KindleTool 1.7.0]
G090WF	White Kindle Basic 3 (2019) (8GB)                            KT4, KT4W8      [Support added in KindleTool 1.7.0]
G0011L	Champagne Kindle Oasis 3 (2019) WiFi (32GB)                  KOA3, KOA3W32C  [Support added in KindleTool 1.7.0]
G000WQ	Kindle Oasis 3 (2019) WiFi+4G (32GB) Japan                   KOA3, KOA3G32JP [Support added in KindleTool 1.7.0]
G000WN	Kindle Oasis 3 (2019) WiFi+4G (32GB)                         KOA3, KOA3G32   [Support added in KindleTool 1.7.0]
G000WM	Kindle Oasis 3 (2019) WiFi (32GB)                            KOA3, KOA3W32   [Support added in KindleTool 1.7.0]
G000WL	Kindle Oasis 3 (2019) WiFi (8GB)                             KOA3, KOA3W8    [Support added in KindleTool 1.7.0]
G000WP	Kindle Oasis 3 (2019) WiFi+4G (32GB) India                   KOA3, KOA3G32IN [Support added in KindleTool 1.7.0]
G001LG	Kindle PaperWhite 5 Signature Edition (2021)                 KPW5SE, PW5SE   [Support added in KindleTool 1.7.0]
G001PX	Kindle PaperWhite 5 (2021)                                   KPW5, PW5       [Support added in KindleTool 1.7.0]
G002BH	Kindle PaperWhite 5 Signature Edition (2021)                 KPW5SE, PW5SE   [Support added in KindleTool 1.7.0]
G002DK	Kindle PaperWhite 5 Kids (2021)                              KPW5, PW5       [Support added in KindleTool 1.7.0]
G002AQ	Kindle Basic 4 (2022)                                        KT5             [Support added in KindleTool 1.7.0]
G002AP	White Kindle Basic 4 (2022)                                  KT5             [Support added in KindleTool 1.7.0]
G00227	Kindle Scribe (16GB)                                         KS              [Support added in KindleTool 1.7.0]
G0023M	White Kindle Scribe (64GB)                                   KS              [Support added in KindleTool 1.7.0]
G0923M	White Kindle Scribe (64GB)                                   KS              [Support added in KindleTool 1.7.0]
EOD

my @kindles = split /\n/, $lines;
if ($sn =~ /^G/i) { $nm = 3; } else { $nm =2; }
$key = substr($sn, $nm, $nm) ;
for (@kindles) { chomp;
  ($prefix, $info) = split /\t/;
  $ss = substr($prefix, $nm, $nm);
  next if length $ss < $nm;
  $model = substr($info, 0, 61); $model =~ s/\s+$//;
  if (length($info) > 61) {
    $nicks = substr($info, 61, 16);
  } else { $nicks = ''; }
  $nicks =~ s/\s+$//;
  if (length($info) > 77) { $notes = substr($info, 77); }
  else { $notes = ''; }
  last if $key =~ /$ss/i;
  if ($sn =~ /^G/i) { $l=6; } else { $l = 4; }
  $prefix = substr($sn, 0, $l) . ' not found.';
  ($model, $nicks, $notes) = ('','','');
}
$y = substr($sn, 8, 1) if length($sn) > 8;
print "Prefix: $prefix\n";
print "Model: $model\n" if $model;
if (defined $y) {
  print "Made: 20x$y";
  printf " Week %d", substr($sn, 9, 2) if length($sn) > 10;
  printf " Day %d", substr($sn, 11, 1) if length($sn) > 11;
  print "\n";
}
print "Nicks: $nicks\n" if $nicks;
print "Notes: $notes\n" if $notes;
