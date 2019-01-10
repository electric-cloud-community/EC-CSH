use warnings;
use strict; 
$|=1;

use ElectricCommander;

#######################################################################
  # trim - deletes blank spaces before and after the entered value in 
  # the argument
  #
  # Arguments:
  #   -untrimmedString: string that will be trimmed
  #
  # Returns:
  #   trimmed string
  #
  ########################################################################  
  sub trim($) {
   
      my ($untrimmedString) = @_;
      
      my $string = $untrimmedString;
      
      #removes leading spaces
      $string =~ s/^\s+//;
      
      #removes trailing spaces
      $string =~ s/\s+$//;
      
      #returns trimmed string
      return $string;
  }

# -------------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------------
my $ec = new ElectricCommander();
  $ec->abortOnError(0);
  
  $::cshCommand = trim($ec->getProperty("/myCall/cshCommand")-> findvalue("//value")->value());


########################################################################
# main - contains the whole process to be done by the plugin, it builds 
#        the command line, sets the properties and the working directory
#
# Arguments:
#   -none

#
# Returns:
#   -nothing
#
########################################################################

sub main() {
    
    # create args array
    my @args = ();
    my %props;

   $props{"cshCommandLine"} = createcshCommandLine(\@args);
    setProperties(\%props);
}

########################################################################
# createcshCommandLine - creates the command line for the invocation
# of the program to be executed.
#
# Arguments:
#   -arr: array containing the command name and the arguments entered by 
#         the user in the UI
#
# Returns:
#   -the command line to be executed by the plugin
#
########################################################################

sub createcshCommandLine($) {

  my ($arr) = @_;

	 my $command="";
 
 #it captures the command and executes it on the csh console    
    
    if($::cshCommand  && $::cshCommand  ne "") {
    
    $command = $::cshCommand;
    }
      return $command;
}

########################################################################
# setProperties - set a group of properties into the Electric Commander
#
# Arguments:
#   -propHash: hash containing the ID and the value of the properties 
#              to be written into the Electric Commander
#
# Returns:
#   -nothing
#
########################################################################

sub setProperties($) {

    my ($propHash) = @_;

    # get an EC object
    my $ec = new ElectricCommander();
    $ec->abortOnError(0);

    foreach my $key (keys % $propHash) {
        my $val = $propHash->{$key};
        $ec->setProperty("/myCall/$key", $val);
    }
}
main();