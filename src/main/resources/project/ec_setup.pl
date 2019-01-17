
# Data that drives the create step picker registration for this plugin.
my %runCSH = (
    label       => "CSH - Run CSH",
    procedure   => "runCSH",
    description => "Integrates CSH Scripting Shell Tool into Electric Commander",
    category    => "Scripting/Shell"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/CSH - Run CSH");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/CSH");

@::createStepPickerSteps = (\%runCSH);
