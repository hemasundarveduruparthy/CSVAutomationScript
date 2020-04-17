###################################################
# CSV Automation Script                           #
# Developed by: hemasundar@gmail.com              #
# Date : 17.04.2020                               #
###################################################

$csvfinaldata = @()
$csvdatapath = "$env:USERPROFILE\Desktop\Siva\test.txt"
$csvdata = Get-content $csvdatapath
$outputdate = get-date -f yyyy-MM-dd
foreach ($line in $csvdata) {
    if($line -match '\d{2}.\d{2}.\d{4}')  {
    $data = $line.Split()
    $data
    $csvfinaldata += New-Object PSObject -Property ([ordered]@{
        
        Date = [string]$data[0]
        'Sr.No.' = ""
        'Main Chain' = ''
        'Sub Chain Name' = [string]$data[4]
        'IP/DTP/ABAP' = [string]$data[5]
        'Source System' = ''
        'Error Message' = ''
        Remarks = ''
        Resource = ''
        })

    }
}
$csvfinaldata | export-csv -Path "$env:USERPROFILE\Desktop\Report_$outputdate.csv" -NoTypeInformation