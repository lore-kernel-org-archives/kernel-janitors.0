From: Jaco Kroon <jaco@kroon.co.za>
Date: Sun, 05 Mar 2006 20:43:46 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in  lib/
Message-Id: <440B4D82.8070705@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29467838720931683=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141548097.6426.9.camel@alice>
In-Reply-To: <1141548097.6426.9.camel@alice>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============29467838720931683==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050004060006020803050407"

This is a cryptographically signed message in MIME format.

--------------ms050004060006020803050407
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Alexey Dobriyan wrote:
> On Sun, Mar 05, 2006 at 09:41:37AM +0100, Eric Sesterhenn wrote:
> 
>>this patch converts lib/ to kzalloc usage.
>>Compile tested with allyesconfig.

>> 	if (!poolp)
>> 		return NULL;
>>-	memset(poolp, 0, sizeof(struct gen_pool));
>>-	poolp->h = kmalloc(sizeof(struct gen_pool_link) *
>>-			   (max_chunk_shift - ALLOC_MIN_SHIFT + 1),
>>-			   GFP_KERNEL);
>>+	poolp->h = kcalloc((max_chunk_shift - ALLOC_MIN_SHIFT + ),
> 
> 
> This will screw ia64.
> 

I don't see how it would even compile in the first place.  But would you
mind explaining how this would screw ia64?

> 
>>+				sizeof(struct gen_pool_link),
>>+				GFP_KERNEL);
>> 	if (!poolp->h) {
>> 		printk(KERN_WARNING "gen_pool_alloc() failed to allocate\n");
>> 		kfree(poolp);
>> 		return NULL;
>> 	}


-- 
There are only 10 kinds of people in this world,
  those that understand binary and those that don't.
http://www.kroon.co.za/

--------------ms050004060006020803050407
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII/zCC
AtowggJDoAMCAQICEGCOKyIwPh/O8sXnHglxoYcwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDEzMTIwMzYzMloX
DTA3MDEzMTIwMzYzMlowQjEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEfMB0G
CSqGSIb3DQEJARYQamFjb0Brcm9vbi5jby56YTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAM+crsvygldZBbroFVKXOL/kr9Uvdqu1Dy/mOLws6U8LJ3+I4X9DtNnod0u+kzkS
DrEBkLqkD+JtZBwcKp50hFreguFdHQf8Q008Dzb0fxWAPcgxm8TyNRZX8gApa4HtSkBXq739
NM2PqwDfB7TvaS3UQkqzWEQp0a8lggdMtQ4Y/2TlyHt2LDrxwvKiqDDn7frRnI498UoM8hRv
OdSNcIop1MkkYTs1Ln0a05nKsrJZduz5DE0i+gljx7hDxXxdMoDjiORXnyjJSEl/YVvueq7B
yM/XFpT1WAzAiGKrbqxPsxLulpoiar7px39CTU2Dwkee5wqSnRdyEQYLsdcEfzkCAwEAAaMt
MCswGwYDVR0RBBQwEoEQamFjb0Brcm9vbi5jby56YTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3
DQEBBAUAA4GBACMDnVVMrJkMcbDapRLLi4iPjSoU7uTsM2EpBcgMJZeAAHPziTo3ig0UfpFH
d0j0thg2u+7/mYJhwk1Zyy26oQmWIW9PSwzEBDuQ/ORc7z5Gtn0QSqRmVJuuIFtrolU1p7Eg
8Yw8sXzMIWAN4ibEfdokWX51q8IY71oXvECC+SeiMIIC2jCCAkOgAwIBAgIQYI4rIjA+H87y
xeceCXGhhzANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3Rl
IENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDYwMTMxMjAzNjMyWhcNMDcwMTMxMjAzNjMyWjBCMR8wHQYD
VQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR8wHQYJKoZIhvcNAQkBFhBqYWNvQGtyb29u
LmNvLnphMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz5yuy/KCV1kFuugVUpc4
v+Sv1S92q7UPL+Y4vCzpTwsnf4jhf0O02eh3S76TORIOsQGQuqQP4m1kHBwqnnSEWt6C4V0d
B/xDTTwPNvR/FYA9yDGbxPI1FlfyAClrge1KQFervf00zY+rAN8HtO9pLdRCSrNYRCnRryWC
B0y1Dhj/ZOXIe3YsOvHC8qKoMOft+tGcjj3xSgzyFG851I1wiinUySRhOzUufRrTmcqysll2
7PkMTSL6CWPHuEPFfF0ygOOI5FefKMlISX9hW+56rsHIz9cWlPVYDMCIYqturE+zEu6WmiJq
vunHf0JNTYPCR57nCpKdF3IRBgux1wR/OQIDAQABoy0wKzAbBgNVHREEFDASgRBqYWNvQGty
b29uLmNvLnphMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAIwOdVUysmQxxsNql
EsuLiI+NKhTu5OwzYSkFyAwll4AAc/OJOjeKDRR+kUd3SPS2GDa77v+ZgmHCTVnLLbqhCZYh
b09LDMQEO5D85FzvPka2fRBKpGZUm64gW2uiVTWnsSDxjDyxfMwhYA3iJsR92iRZfnWrwhjv
Whe8QIL5J6IwggM/MIICqKADAgECAgENMA0GCSqGSIb3DQEBBQUAMIHRMQswCQYDVQQGEwJa
QTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoT
EVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG
9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcN
MTMwNzE2MjM1OTU5WjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRp
bmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vp
bmcgQ0EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f
6f+jHuy9zfVb8hp2vX8MOmHyv1HOAdTlUAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/Ef
kTYkKhPPK9Xzgnc9A74r/rsYPge/QIACZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7
AgMBAAGjgZQwgZEwEgYDVR0TAQH/BAgwBgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRw
Oi8vY3JsLnRoYXd0ZS5jb20vVGhhd3RlUGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8E
BAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAYBgNVBAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqG
SIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2jZqxnD3+vrL7CF6FDlpSdf0whuPg2H6otnzYvwPQc
UCCTcDz9reFhYsPZOhl+hLGZGwDFGguCdJ4lUJRix9sncVcljd2pnDmOjCBPZV+V2vf3h9bG
CE6u9uo05RAaWzVNd+NWIXiC3CEZNd4ksdMdRv9dX2VPMYIDZDCCA2ACAQEwdjBiMQswCQYD
VQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEGCOKyIwPh/O8sXnHglx
oYcwCQYFKw4DAhoFAKCCAcMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMDYwMzA1MjA0MzQ2WjAjBgkqhkiG9w0BCQQxFgQUTZT9yj7ASHvi9t3L4aGfV8Qt
XoAwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF
5x4JcaGHMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF5x4JcaGHMA0GCSqGSIb3DQEBAQUABIIB
AM5xOIZJ50sJrg1WgOW1VquXK6weX6Cbt5kKABtdCkuJpVEotkHW4AnJIbyYJACfJytoR522
i1UQENX3DTlpFVu6rLjoCvjsqg45eUpiTCZd7Pcsa8vZR5KiMjalCaBd9GB6qm2Ic6/hROaP
44cGKhX10OLX8XVBZh7dqSKlOHhatBPsdcW8p3XcmMKHMttd/auLPZCKQmqhKnzitHDxYK0u
z+hL6ijJLNoAPzLOJ2pX7Lm+riiifd3oCrDm0R8A1NX/q3OJtrhQYDZtn8cQ3NA3W6ZuM/L+
wCpK+JJd+obkC3MRzFsNsgElGecDl/w8KhtunXL642gc8kDJkpWKHqgAAAAAAAA=
--------------ms050004060006020803050407--

--===============29467838720931683==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29467838720931683==--
