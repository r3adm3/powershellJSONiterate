
#fill variable with content
$myJSONresult = invoke-webrequest https://www.gov.uk/bank-holidays.json

#display the whole "object"
#write-output $myJSONresult

#display just the content itself we're interested in. 
#write-output $myJSONresult.content

$myInvokeJSONreqResult = invoke-restmethod https://www.gov.uk/bank-holidays.json

$another = $myInvokeJSONreqResult.scotland.events | where-object {$_.date -gt 2022-01-01}

write-output $another