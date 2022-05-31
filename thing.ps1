
#fill variable with content
$myJSONresult = invoke-webrequest https://www.gov.uk/bank-holidays.json

#display the whole "object"
#write-output $myJSONresult

#display just the content itself we're interested in. 
#write-output $myJSONresult.content

$myInvokeJSONreqResult = invoke-restmethod https://www.gov.uk/bank-holidays.json
#write-output $myInvokeJSONreqResult.scotland.events

$counter = 0

foreach ($event in $myInvokeJSONreqResult.scotland.events)
{
    #write-output "$counter : Suzanne is Great"
    #$event.date is a string so we need to convert it to a string to do a proper comparison
    
    $myDataDate = $event.date
    
    if ($myDataDate -gt '2022-01-01')
    {
        write-output "$counter : $myDataDate"
    }

    
    
    #$myDate = [datetime]::ParseExact($event.date, 'yyyy-MM-dd', $null)

    #if ($myDate -gt [datetime]::ParseExact('2022-01-01', 'yyyy-MM-dd', $null))
    #{
        #write-output "$i :  $($event.date)"
       # $i = $i + 1
    #}
    
    $counter = $counter + 1
}

