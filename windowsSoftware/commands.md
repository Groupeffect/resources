# Product key
https://www.techrepublic.com/article/3-simple-ways-to-find-your-windows-10-product-key/

- type in pwershell
`
C:\>\Windows\System32>powershell "(GET-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey"
`

- search registry editor
`
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlattform\BackupProductKeyDefault
`