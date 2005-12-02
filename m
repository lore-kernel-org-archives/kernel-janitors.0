From: Jaco Kroon <jaco@kroon.co.za>
Date: Fri, 02 Dec 2005 20:48:22 +0000
Subject: Re: [KJ] [patch] potential data-corruption fix in md.c
Message-Id: <4390B316.4010508@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36718607959968441=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
In-Reply-To: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============36718607959968441==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050302070809070501000709"

This is a cryptographically signed message in MIME format.

--------------ms050302070809070501000709
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

H=E5kon L=F8vdal wrote:
> On 12/2/05, Jaco Kroon <jaco@kroon.co.za> wrote:
>=20
>>Or just cast to (unsigned int) for the check?
>>Perhaps that happens implicitly?
>>Would that be compiler dependant?
>=20
>=20
> The conversion does indeed happen implicit, and the C standard
> (ISO/IEC 9899:1990) does very specific specify how this should be done,
> see "6.2.1.5 Usual arithmetic conversions" for details.
>=20
> The short version is that a smallest type is promoted to the biggest ty=
pe
> as well that unsigned "wins" over signed. The last point can result in
> some unexpected results if you are not careful.
> Example: What does the following program print?
>=20
> #include <stdio.h>
> int main(int argc, char *argv[])
> {
>         unsigned int i =3D 12345;
>         if (i < -1)
>                 printf("(%d < -1)\n", i);
>         else
>                 printf("! (%d < -1)\n", i);
>         return 0;
> }

jkroon@pug tmp $ gcc -o signed_unsigned signed_unsigned.c
jkroon@pug tmp $ gcc -o signed_unsigned signed_unsigned.c -Wall -W
signed_unsigned.c: In function `main':
signed_unsigned.c:5: warning: comparison between signed and unsigned
signed_unsigned.c: At top level:
signed_unsigned.c:2: warning: unused parameter 'argc'
signed_unsigned.c:2: warning: unused parameter 'argv'
jkroon@pug tmp $ ./signed_unsigned
(12345 < -1)
jkroon@pug tmp $

Which means that gcc is smart enough to recognise that you are doing
something unusual, and 12345 is indeed < -1 due to the fact that -1 is
in fact 2 ^ 32 - 1.  As such the test in register_md_personality with
pnum >=3D MAX_PERSONALITY is in fact sufficient since MAX_PERSONALITY is
unsigned, so pnum gets converted to unsigned (negative values becomes
extremely large) and as such the <0 is done "by accident".

Very, very nice, but extremely unclear from the code :).

Jaco
--=20
There are only 10 kinds of people in this world,
  those that understand binary and those that don't.
http://www.kroon.co.za/

--------------ms050302070809070501000709
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII5TCC
As0wggI2oAMCAQICAw3p1jANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDUwMTI4MjExMjIzWhcNMDYwMTI4MjExMjIz
WjBCMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR8wHQYJKoZIhvcNAQkBFhBq
YWNvQGtyb29uLmNvLnphMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4CsLuOWD
wimwAv4QLdlT99frJCwzUBVQNL7c7x4ufEquAH6RamWfQyQHzykEJM8NeMIrfb+k3fZEi+ZU
g5sq2uIqzOuCJsIj0x3LnoydXTikbv1AFWQDEuqITlroA8bGJE/mMlbPrKyDACPo5cQAzUQz
LAg7LQQQVkKNWH4eeXUwZ5lOZEWWno0P5DXHdSLQxCshgWVPRrbtKe25WGObqJMa//1T5qX8
0mKIdAbHlz90BwgX/MjLp0BpXTii2653ScOujCLTC3cPdDUDK68qG7RqatVw5+HE/npJIWa1
0TxJUp5Ii8nPbGPzpEWQmZ8TjkjMs26w80PPPKh2Vh2siQIDAQABoy0wKzAbBgNVHREEFDAS
gRBqYWNvQGtyb29uLmNvLnphMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAqXNX
QEMTVQoj3JoEwK9vlfqSVz5ZEUklpgEhwFJsD+PKa/LgUGVHk3Gw8wws4+wZxmpOsJ7vdiWL
y8zlX7HfPWMcbibTi6C7nT6WahqdeAo3kVjhnMqJ3Sf6sX0JGl9bWfIhgmIVy/ZdM2ztrXwd
rbWiT7un5lM05D4YPCNH9fcwggLNMIICNqADAgECAgMN6dYwDQYJKoZIhvcNAQEEBQAwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA1MDEyODIx
MTIyM1oXDTA2MDEyODIxMTIyM1owQjEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJl
cjEfMB0GCSqGSIb3DQEJARYQamFjb0Brcm9vbi5jby56YTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAOArC7jlg8IpsAL+EC3ZU/fX6yQsM1AVUDS+3O8eLnxKrgB+kWpln0Mk
B88pBCTPDXjCK32/pN32RIvmVIObKtriKszrgibCI9Mdy56MnV04pG79QBVkAxLqiE5a6APG
xiRP5jJWz6ysgwAj6OXEAM1EMywIOy0EEFZCjVh+Hnl1MGeZTmRFlp6ND+Q1x3Ui0MQrIYFl
T0a27SntuVhjm6iTGv/9U+al/NJiiHQGx5c/dAcIF/zIy6dAaV04otuud0nDrowi0wt3D3Q1
AyuvKhu0amrVcOfhxP56SSFmtdE8SVKeSIvJz2xj86RFkJmfE45IzLNusPNDzzyodlYdrIkC
AwEAAaMtMCswGwYDVR0RBBQwEoEQamFjb0Brcm9vbi5jby56YTAMBgNVHRMBAf8EAjAAMA0G
CSqGSIb3DQEBBAUAA4GBAKlzV0BDE1UKI9yaBMCvb5X6klc+WRFJJaYBIcBSbA/jymvy4FBl
R5NxsPMMLOPsGcZqTrCe73Yli8vM5V+x3z1jHG4m04ugu50+lmoanXgKN5FY4ZzKid0n+rF9
CRpfW1nyIYJiFcv2XTNs7a18Ha21ok+7p+ZTNOQ+GDwjR/X3MIIDPzCCAqigAwIBAgIBDTAN
BgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTES
MBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UE
CxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBl
cnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1Ro
YXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAK
MNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTX
p6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYB
Af8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBl
cnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYD
VQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2as
Zw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSe
JVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHT
HUb/XV9lTzGCAzswggM3AgEBMGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAgMN6dYwCQYFKw4DAhoFAKCCAacwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDUxMjAyMjA0ODIyWjAjBgkqhkiG9w0BCQQxFgQUWUNY
cAPlBrVOv0fqJRmUvszMfUEwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG
9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYB
BAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vpbmcg
Q0ECAw3p1jB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAgMN6dYwDQYJKoZIhvcNAQEBBQAEggEAPoS1RfQY9ZG8x/Hc
ddsEBGrXIAnb11Ej4mk28ePe2CVVYc+UdyoADgZcDzc9sK5/vv10IUjjLHyFxQpPtGZtCE6k
jQASBGGE0D+wQ5ikW2oDIADRlcIweH9YM028EyYXiPDaEsB/TemfZyTfnPby02rRhdXEOLpk
qE91WsAWmqq4nRnJP5LeLz/Ho15d11XJz6hRF0EPmpY/B5fX/hAoNdK8YkZcZ6OH5XIUuN0x
4Fv80X1x/ZA6dGrgrKB3pgoSA91grOY7+wxGSI2hxnjm2reaFig6mMPXt+pgu2RchUGyIdAZ
Y9RxolwlXfi87337QwajbvHSAL6V8iWIaPdj+gAAAAAAAA==
--------------ms050302070809070501000709--

--===============36718607959968441==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36718607959968441==--
