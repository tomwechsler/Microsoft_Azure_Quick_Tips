Set-Location c:\
Clear-Host

#We need the cmdlets
Install-Module -Name AzureAD -AllowClobber -Force -Verbose

#Sometimes the module must be imported
Import-Module AzureAD

#Username and PW for Login
$Credential = Get-Credential

#Lets connect to the Azure Active Directory
Connect-AzureAD -Credential $Credential

#View all accounts
Get-AzureADUser

#View a specific account
Get-AzureADUser -ObjectID jane.ford@tomwechsler.xyz

#View additional property values for the cmdlet
Get-AzureADUser | Get-Member

#View additional property values for a specific account
Get-AzureADUser | Select-Object DisplayName,Department,UsageLocation

#To see all the properties for a specific user account
Get-AzureADUser -ObjectID jane.ford@tomwechsler.xyz | Select-Object *

#As another example, check the enabled status of a specific user account
Get-AzureADUser -ObjectID jane.ford@tomwechsler.xyz | Select-Object DisplayName,UserPrincipalName,AccountEnabled

#View account synchronization status
Get-AzureADUser | Where-Object {$_.DirSyncEnabled -eq $true}

#Find cloud-only accounts
Get-AzureADUser | Where-Object {$_.DirSyncEnabled -ne $false}

#View accounts based on a common property
Get-AzureADUser | Where-Object {$_.UsageLocation -eq $Null}

#List all accounts of users who live in London
Get-AzureADUser | Where-Object {$_.City -eq "London"}
