#
# little tatort utility showing whats needed
# 
my $vid_dir = qq(D:/Media/Video/German/Tv/Tatort);
my ($have,$needed);

for (glob( $vid_dir . "/*.*")) {
        if ( /Tatort - (\d+) - (.*?) - (.*?) - (.*?)\.(.*?)/) {
                $have->{$1} = { episode => $1,
                                send_date => $2,
                                investigator => $3,
                                title => $4 ,
                                ext => $5,
                        };
        }
}


for ( 1..800) {
  push @$needed, $_ unless ($have->{$_});
} 
if ( $#ARGV == -1) {
        print "Need:\n", join( "\n", @$needed), "\n";
} else {
  for ( @ARGV) {
    if ( $have->{$_}) {
      print $_, " have: ", $have->{$_}->{send_date}, " ", $have->{$_}->{investigator}, ": ", $have->{$_}->{title}, "\n";
    } else {
      print $_, " need\n";
    }
  }
}


