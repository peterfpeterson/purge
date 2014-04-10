#!/usr/bin/perl
####################
# Created on Oct 17, 2002 by: Peter Peterson
# Last Modified: Oct 17, 2002
####################
use strict;
my($debug)=0;

sub standardDir{
  my($return)=@_;

  (print "$return -> ")if($debug>1);
  unless($return=~m%/$%){
    $return.='/';
  }

  (print "$return -> ")if($debug>1);
  unless($return=~/^\.?\//){
    $return='./'.$return;
  }

  (print "$return -> ")if($debug>1);
  $return=~s/^\.\//$ENV{'PWD'}\//;

  (print "$return -> ")if($debug>1);
  while($return=~/\.\.\//){
    $return=~s/\w+\/\.\.\///;
  }

  (print "$return -> ")if($debug>1);
  $return=~s/\.\///g;

  (print "$return\n")if($debug>1);
  return $return;
}
