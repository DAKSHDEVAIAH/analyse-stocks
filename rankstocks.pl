#!/bin/perl
$filename = $ARGV[0];
$budget = $ARGV[1];
#print ("$filename \n");
#print ("$budget\n");
open(FH, '<', $filename) or die $!;

#while(<FH>){
#   print $_;
#}

while (<FH>){
	chomp $_;
	#print $_;
	if ($_=~ /\"last_price\"/){
		$_ =~ s/class//g;
		$_ =~ s/	//g;
		$_ =~ s/\"last_price\"//g;
		$_ =~ s/span//g;
		$_ =~ s/\$//g;
		$_ =~ s/p//g;
		$_ =~ s/ =//g;
		$_ =~ s/\///g;
		$_ =~ s/\<//g;
		$_ =~ s/\>//g;
		$_ =~ s/USD//g;
		$cost = $_;
		if ($_ <= $budget){
			print ("$title , $status , $cost \n");
		}
	}
	if ($_=~ /3-Hold/){
	#	print ("Hold \n");
		$status = "Hold";
	}
	if ($_=~ /2-Buy/){
	#	print ("Buy \n");
		$status = "Buy";
	}
	if ($_=~ /4-Sell/){
	#	print ("Sell \n");
		$status = "Sell";
	}
	if ($_=~ /1-Strong Buy/){
	#	print ("Buy \n");
		$status = "Strong Buy";
	}
	if ($_=~ /5-Strong Sell/){
	#	print ("Strong Sell \n");
		$status = "Strong Sell";
	}
	if ($_=~ /\/title/){
		$_ =~ s/title//g;
		$_ =~ s/\<//g;
		$_ =~ s/\>//g;
		$_ =~ s/-//g;
		$_ =~ s/\///g;
		$_ =~ s/    //g;
		$_ =~ s/Zacks//g;
		$_ =~ s/Stock Price Today//g;
		$title = $_;
	#	print ("$_");
	}	
}
close(FH);
