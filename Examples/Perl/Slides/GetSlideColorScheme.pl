#ExStart:1
use lib 'lib';
use strict;
use warnings;
use utf8;
use File::Slurp; # From CPAN
use JSON;

use AsposeStorageCloud::StorageApi;
use AsposeStorageCloud::ApiClient;
use AsposeStorageCloud::Configuration;

use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::ApiClient;
use AsposeSlidesCloud::Configuration;

my $configFile = '../Config/config.json';
my $configPropsText = read_file($configFile);
my $configProps = decode_json($configPropsText);
my $data_path = '../../../Data/';
my $out_path = $configProps->{'out_folder'};

$AsposeSlidesCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeSlidesCloud::Configuration::api_key = $configProps->{'api_key'};
$AsposeSlidesCloud::Configuration::debug = 1;

$AsposeStorageCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeStorageCloud::Configuration::api_key = $configProps->{'api_key'};

# Instantiate Aspose.Storage and Aspose.Slides API SDK
my $storageApi = AsposeStorageCloud::StorageApi->new();
my $slidesApi = AsposeSlidesCloud::SlidesApi->new();

# Set input file name
my $name = 'sample-input.pptx';
my $slideIndex = 1;

# Upload file to aspose cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name);

# Invoke Aspose.Slides Cloud SDK API to get font scheme of a particular slide                             
$response = $slidesApi->GetSlidesThemeColorScheme(name => $name, slideIndex=>$slideIndex);

if($response->{'Status'} eq 'OK'){
	my $colorScheme = $response->{'ColorScheme'};
	print "\nAccent1 : " .  $colorScheme->{'Accent1'};
	print "\nAccent2 : " .  $colorScheme->{'Accent2'};
	print "\nDark1 : " .  $colorScheme->{'Dark1'};
	print "\nDark2 : " .  $colorScheme->{'Dark2'};
	print "\nLight1 : " .  $colorScheme->{'Light1'};	
}
#ExEnd:1