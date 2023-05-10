# Fill our connections informations
$AppId = '130d7438-b3c0-4145-a4cd-b1868f290ef8'
$AppSecret = '1OV8Q~5WarEh9B~lq86nrM8Wb3UljKrI-~qnybtx'
$TenantName = "pepkorsea.onmicrosoft.com"
  
# Create body
$Body = @{
    client_id     = $AppId
    client_secret = $AppSecret
    scope         = 'https://graph.microsoft.com/.default'
    grant_type    = 'client_credentials'

}

# Call the OAUTH2 endpoint
$tokenRequest = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$TenantName/oauth2/v2.0/token" -Method Post -Body $Body
$groupName = "IT Ops Campfire"

# Create header for Authentication
$Header = @{
    Authorization = "$($tokenRequest.token_type) $($tokenRequest.access_token)"
}
 
# Build URI to find the Group
$Uri = "https://graph.microsoft.com/v1.0/groups?`$filter=displayName eq '$groupName'"
$GroupRequest = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get 

# Get the SP Site ID
$uri = "https://graph.microsoft.com/v1.0/groups/$($GroupRequest.value.id)/sites/root"
$ListSites = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get

#Get the List ID
$listname = "Linkley Creds"
$uri = "https://graph.microsoft.com/v1.0/sites/$($ListSites.id)/lists/$listname"
$fileID = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get

#Get the List Data
$listname = "Linkley Creds"
$uri = "https://graph.microsoft.com/v1.0/sites/$($ListSites.id)/lists/$($fileID.id)?expand=columns,items(expand=fields)"
$fileID = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get
$data = $fileID.items.fields #| ConvertTo-Json | Out-File Lists.json
#$data | where-object { $_.field_1 -eq "0026" }
