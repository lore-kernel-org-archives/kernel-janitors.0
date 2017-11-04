From: "Kershner, David A" <David.Kershner@unisys.com>
Date: Sat, 04 Nov 2017 01:26:50 +0000
Subject: RE: [PATCH] staging: unisys: visorchipset: Use common error handling code in setup_crash_devices_wor
Message-Id: <CY4PR07MB3176A9584D22819C938A6ABFF0520@CY4PR07MB3176.namprd07.prod.outlook.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_0000_01D354EA.6331B9C0"
List-Id: <kernel-janitors.vger.kernel.org>
References: <d2542edd-2bd6-db05-2d60-2b601e73111c@users.sourceforge.net>
In-Reply-To: <d2542edd-2bd6-db05-2d60-2b601e73111c@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, *S-Par-Maintainer <SParMaintainer@unisys.com>, "Thompson, Bryan E." <bryan.thompson@unisys.com>, "Binder, David Anthony" <David.Binder@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sameer Wadgaonkar <sameer.wadgaonkar@unisys.com>, "Sell, Timothy C" <Timothy.Sell@unisys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

------=_NextPart_000_0000_01D354EA.6331B9C0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: SF Markus Elfring [mailto:elfring@users.sourceforge.net]
> Sent: Friday, November 3, 2017 3:50 PM
> To: devel@driverdev.osuosl.org; *S-Par-Maintainer
> <SParMaintainer@unisys.com>; Thompson, Bryan E.
> <bryan.thompson@unisys.com>; Binder, David Anthony
> <David.Binder@unisys.com>; Kershner, David A
> <David.Kershner@unisys.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Sameer Wadgaonkar
> <sameer.wadgaonkar@unisys.com>; Sell, Timothy C
> <Timothy.Sell@unisys.com>
> Cc: LKML <linux-kernel@vger.kernel.org>; kernel-janitors@vger.kernel.org
> Subject: [PATCH] staging: unisys: visorchipset: Use common error handling
> code in setup_crash_devices_work_queue()
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 3 Nov 2017 20:37:03 +0100
>
> * Add a jump target so that a specific error message is stored only once
>   at the end of this function implementation.
>
> * Replace four calls of the function "dev_err" by goto statements.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks for the catch!


Acked-by: David Kershner <david.kershner@unisys.com>



> ---
>  drivers/staging/unisys/visorbus/visorchipset.c | 36 
> ++++++++++++------------
> --
>  1 file changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/staging/unisys/visorbus/visorchipset.c
> b/drivers/staging/unisys/visorbus/visorchipset.c
> index fed554a43151..1d54821dd7b6 100644
> --- a/drivers/staging/unisys/visorbus/visorchipset.c
> +++ b/drivers/staging/unisys/visorbus/visorchipset.c
> @@ -1231,11 +1231,9 @@ static void
> setup_crash_devices_work_queue(struct work_struct *work)
>  	if (visorchannel_read(chipset_dev->controlvm_channel,
>  			      offsetof(struct visor_controlvm_channel,
>  				       saved_crash_message_count),
> -			      &local_crash_msg_count, sizeof(u16)) < 0) {
> -		dev_err(&chipset_dev->acpi_device->dev,
> -			"failed to read channel\n");
> -		return;
> -	}
> +			      &local_crash_msg_count, sizeof(u16)) < 0)
> +		goto report_read_failure;
> +
>  	if (local_crash_msg_count != CONTROLVM_CRASHMSG_MAX) {
>  		dev_err(&chipset_dev->acpi_device->dev, "invalid
> count\n");
>  		return;
> @@ -1244,30 +1242,24 @@ static void
> setup_crash_devices_work_queue(struct work_struct *work)
>  	if (visorchannel_read(chipset_dev->controlvm_channel,
>  			      offsetof(struct visor_controlvm_channel,
>  				       saved_crash_message_offset),
> -			      &local_crash_msg_offset, sizeof(u32)) < 0) {
> -		dev_err(&chipset_dev->acpi_device->dev,
> -			"failed to read channel\n");
> -		return;
> -	}
> +			      &local_crash_msg_offset, sizeof(u32)) < 0)
> +		goto report_read_failure;
> +
>  	/* read create device message for storage bus offset */
>  	if (visorchannel_read(chipset_dev->controlvm_channel,
>  			      local_crash_msg_offset,
>  			      &local_crash_bus_msg,
> -			      sizeof(struct controlvm_message)) < 0) {
> -		dev_err(&chipset_dev->acpi_device->dev,
> -			"failed to read channel\n");
> -		return;
> -	}
> +			      sizeof(struct controlvm_message)) < 0)
> +		goto report_read_failure;
> +
>  	/* read create device message for storage device */
>  	if (visorchannel_read(chipset_dev->controlvm_channel,
>  			      local_crash_msg_offset +
>  			      sizeof(struct controlvm_message),
>  			      &local_crash_dev_msg,
> -			      sizeof(struct controlvm_message)) < 0) {
> -		dev_err(&chipset_dev->acpi_device->dev,
> -			"failed to read channel\n");
> -		return;
> -	}
> +			      sizeof(struct controlvm_message)) < 0)
> +		goto report_read_failure;
> +
>  	/* reuse IOVM create bus message */
>  	if (!local_crash_bus_msg.cmd.create_bus.channel_addr) {
>  		dev_err(&chipset_dev->acpi_device->dev,
> @@ -1282,6 +1274,10 @@ static void
> setup_crash_devices_work_queue(struct work_struct *work)
>  		return;
>  	}
>  	visorbus_device_create(&local_crash_dev_msg);
> +	return;
> +
> +report_read_failure:
> +	dev_err(&chipset_dev->acpi_device->dev, "failed to read
> channel\n");
>  }
>
>  void visorbus_response(struct visor_device *bus_info, int response,
> --
> 2.15.0


------=_NextPart_000_0000_01D354EA.6331B9C0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIa5TCCBJEw
ggN5oAMCAQICBEVrUFQwDQYJKoZIhvcNAQEFBQAwgbAxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1F
bnRydXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRl
ZCBieSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDA2IEVudHJ1c3QsIEluYy4xLTArBgNVBAMT
JEVudHJ1c3QgUm9vdCBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0wNjExMjcyMDIzNDJaFw0y
NjExMjcyMDUzNDJaMIGwMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjE5MDcG
A1UECxMwd3d3LmVudHJ1c3QubmV0L0NQUyBpcyBpbmNvcnBvcmF0ZWQgYnkgcmVmZXJlbmNlMR8w
HQYDVQQLExYoYykgMjAwNiBFbnRydXN0LCBJbmMuMS0wKwYDVQQDEyRFbnRydXN0IFJvb3QgQ2Vy
dGlmaWNhdGlvbiBBdXRob3JpdHkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2lbZD
QvrGbSpvSN+UTDlXBe7DeRFBaDbt7P6aAY+hOCj89xBGZi5NHhqxGk7G0cCViLDJ/zGLMwPbt4N7
PiCEXu2yViin+OC5QHE3xctHDpcqaMAilWIV20fZ9dAr/4JLya0+3kzbkIBQPwmKhADsMAo9GM37
/SpZmiOVFyxFnh9uQ3ltDFyY/kinxSNHXF79bucetPZoRdGGg1uiio2x4ymA/iVxiK2+vI+sUpZL
qlGN5BMxGehOTZ/brLNq1bw5VHHKenp/kN19HYDZgbtZJsIR/uaT4veA5GX7NDcOKYBwTa84hi6e
f1evnheu6xzLKCFfthzY56IEIvnT2tjLAgMBAAGjgbAwga0wDgYDVR0PAQH/BAQDAgEGMA8GA1Ud
EwEB/wQFMAMBAf8wKwYDVR0QBCQwIoAPMjAwNjExMjcyMDIzNDJagQ8yMDI2MTEyNzIwNTM0Mlow
HwYDVR0jBBgwFoAUaJDkZ6SmU4DHhmak8fdLQ/uEvW0wHQYDVR0OBBYEFGiQ5GekplOAx4ZmpPH3
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
AwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBSZ+FPI7g00UIYc/bFnCMHBJiBu/jAfBgNVHSMEGDAW
gBReR8gw8UO/Ac86IwPAngECA1h+YTBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vdWlzcGtpLnVu
aXN5cy5jb20vcmVwL1VJUy1Jc3VCMS1DQSg2KS5jcmwwdwYIKwYBBQUHAQEEazBpMDwGCCsGAQUF
BzAChjBodHRwOi8vdWlzcGtpLnVuaXN5cy5jb20vcmVwL1VJUy1Jc3VCMS1DQSg2KS5jcnQwKQYI
KwYBBQUHMAGGHWh0dHA6Ly9wZWNzMS51bmlzeXMuY29tL29jc3AvMCQGA1UdEQQdMBuBGURhdmlk
LktlcnNobmVyQHVuaXN5cy5jb20wDQYJKoZIhvcNAQELBQADggEBAL8zWWN9J1FxiaryLkKHfBqF
GAYoetQCdRH8nKogMfCjIOVC7t5QzCECDCZsMrQngzXY6Dnu19+IF7hfG3uM2hiDE6AEvlgaMLmP
lyCpLay9DIwSpB04RsQXYrhks8Pw6WSubVJL+q3XAwb00QCh5WEWVSTtuOeGMevMOzUamIw4GVzu
OJiUUzGCf3XnoukIeZB48xaLpSIogOI30kjHZ10Cx4Gg8Uvdfd2ir2aXfCYeys7vEPgH8EoqqTa/
ouSwssmp07mrIIbOo1eLvBYstKUnTMkYMN107JERS50wCidCcNGSFbLHpPwKrpCDjtkAU81yoUtq
Bmas8orCLoQCD10wggcAMIIF6KADAgECAgoQSGGkAAYAAAAYMA0GCSqGSIb3DQEBCwUAMBYxFDAS
BgNVBAMTC1VJUy1JbnRCLUNBMB4XDTE1MTAxOTE3NTUzMloXDTIxMTAxOTE4MDUzMlowWTETMBEG
CgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBnVuaXN5czETMBEGCgmSJomT8ixkARkW
A3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAzxZCmWWZPZnkBSMK2ALw+me532YzNjAaJ8Jl+0C1MP8XpiqmSYu7XzXG0hoJpSnQTftHtz/E
j9T67yMl/KFgGtD+0fJgddgb+mUPOB4o2E0mFC0xMR5mm23plCGPVfdH1r+WEFYuAZpcHh6ke5y8
vy9TzChemi/YDKREw+7z+2R7oTwQ2/S8eDWRxuvrAN+4qqoAcgDMv4N2EvHXkeuV1P5D9H6aEhLg
TkwvRCS2SSftXLQYMsvio1x5CLbag4fIHJ6uBR93DRUBj9wcTOe1POiDv+v6UkqaUnZ7SG96lnjp
ZBup4srwdEJFFyqD5kq9Ux+IPPfRTR4hpE0kevoLhwIDAQABo4IECzCCBAcwDgYDVR0PAQH/BAQD
AgGGMBIGCSsGAQQBgjcVAQQFAgMGAAYwIwYJKwYBBAGCNxUCBBYEFKwIWz4yX+iqzaNJt5hs96yY
nEN7MB0GA1UdDgQWBBReR8gw8UO/Ac86IwPAngECA1h+YTCCAiAGA1UdIASCAhcwggITMDkGCmCG
SAGG/TABAQcwKzApBggrBgEFBQcCARYdaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3JlcC8wOQYK
YIZIAYb9MAEBPTArMCkGCCsGAQUFBwIBFh1odHRwOi8vdWlzcGtpLnVuaXN5cy5jb20vcmVwLzA5
BgpghkgBhv0wAQEDMCswKQYIKwYBBQUHAgEWHWh0dHA6Ly91aXNwa2kudW5pc3lzLmNvbS9yZXAv
MDkGCmCGSAGG/TABAQIwKzApBggrBgEFBQcCARYdaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3Jl
cC8wOQYKYIZIAYb9MAEBBDArMCkGCCsGAQUFBwIBFh1odHRwOi8vdWlzcGtpLnVuaXN5cy5jb20v
cmVwLzA5BgpghkgBhv0wAQEFMCswKQYIKwYBBQUHAgEWHWh0dHA6Ly91aXNwa2kudW5pc3lzLmNv
bS9yZXAvMDkGCmCGSAGG/TABAQ4wKzApBggrBgEFBQcCARYdaHR0cDovL3Vpc3BraS51bmlzeXMu
Y29tL3JlcC8wOQYKYIZIAYb9MAEBATArMCkGCCsGAQUFBwIBFh1odHRwOi8vdWlzcGtpLnVuaXN5
cy5jb20vcmVwLzA5BgpghkgBhv0wAQEGMCswKQYIKwYBBQUHAgEWHWh0dHA6Ly91aXNwa2kudW5p
c3lzLmNvbS9yZXAvMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQIMAYBAf8C
AQAwHwYDVR0jBBgwFoAUcjcBNj34ZtYDmE71+AAupCSqdiAwcQYDVR0fBGowaDBmoGSgYoYvaHR0
cDovL3Vpc3BraS51bmlzeXMuY29tL3JlcC9VSVMtSW50Qi1DQSg2KS5jcmyGL2h0dHA6Ly9wa2ly
ZXAudW5pc3lzLmNvbS9yZXAvVUlTLUludEItQ0EoNikuY3JsMIG1BggrBgEFBQcBAQSBqDCBpTA7
BggrBgEFBQcwAoYvaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3JlcC9VSVMtSW50Qi1DQSg2KS5j
cnQwOwYIKwYBBQUHMAKGL2h0dHA6Ly9wa2lyZXAudW5pc3lzLmNvbS9yZXAvVUlTLUludEItQ0Eo
NikuY3J0MCkGCCsGAQUFBzABhh1odHRwOi8vcGVjczEudW5pc3lzLmNvbS9vY3NwLzANBgkqhkiG
9w0BAQsFAAOCAQEAVnYItqwJLH0Vg4aQZWxCNSNqsOz2wd0sIbT+/5NIoeM+owWFaVdNU/aNZZyj
tRSfJt+hJELd3ZYb9sHUQnyZCfvNaaB2wVDPnTOUmkvWVoiiGx8sbHpuETiIkIqGB3xFGOtB3XdO
t00L18sCGGpuMGuNFYDW7GAPexeu7uUOuW7BkjvBcJnh1xIjS97R6gG7av4hkoK39YUQwZvU3HAg
of7JCf9x4zObylzY/++ojSgt8R6/L6khADxL3huB2F+ep7Qxj29s5GhyVwT96oH39CPk6JNeXrpn
IpUD3Wq1CJtj4NOm9Gg9X/kri8RvDBqS1l+dOBSboxlp9GMYxo891TGCA5MwggOPAgEBMHAwWTET
MBEGCgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBnVuaXN5czETMBEGCgmSJomT8ixk
ARkWA3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNBAhM5AAFI0Zc3LJpNvcO8AAYAAUjRMAkGBSsO
AwIaBQCgggH4MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE3MTEw
NDAxMjYxOFowIwYJKoZIhvcNAQkEMRYEFAQGhox9acHU7HI3O2aLHrv8165MMH8GCSsGAQQBgjcQ
BDFyMHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBnVuaXN5czETMBEG
CgmSJomT8ixkARkWA3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNBAhM5AAE4tzfd+TfZRiCsAAYA
ATi3MIGBBgsqhkiG9w0BCRACCzFyoHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT
8ixkARkWBnVuaXN5czETMBEGCgmSJomT8ixkARkWA3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNB
AhM5AAE4tzfd+TfZRiCsAAYAATi3MIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsG
CWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAKnN5o3vlleY2SaNW+LmQVLP88W56xE7knhEYFUUriaXpa41yTJI
EqqY2RvHJ6p6W7ZyIcKb6kzbTJNzzXmziccpg+2zGDDfn7qqAC6FQAMkhXF6sBvqigqKUN/HBhXQ
WgEmWou+5TxfCR/qEnRu6Es1xVVGvSVahARLbAU79Ks3Ul5JItK20wc3z2/C7dotYnT7VMm5Vknp
VIrzZFYpatOK8BaRttQAEdahh2Y/U36T9eBX1ahtLYVJ43AX2HBMDt1ksnzSOolhQJNrcZagrGMT
wtKhm4olNQ9pFIfP//d80e81wVjjqqxz+hX+efdRnCuu447Ugr7VywGeNJIaY/oAAAAAAAA=

------=_NextPart_000_0000_01D354EA.6331B9C0--
