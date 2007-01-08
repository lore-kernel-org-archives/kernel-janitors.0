From: Jaco Kroon <jaco@kroon.co.za>
Date: Mon, 08 Jan 2007 16:15:15 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <45A26E13.30409@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1678878670=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============1678878670==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010905090406050802010706"

This is a cryptographically signed message in MIME format.

--------------ms010905090406050802010706
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thomas Petazzoni wrote:
> Hi,
>=20
> Le Sat, 6 Jan 2007 13:32:30 +0200 (SAST),
> "Jaco Kroon" <jaco@kroon.co.za> a =E9crit :
>=20
>=20
>>Whilst we're on the topic, I know it's "bad" to dereference a
>>user-space pointer, but from what I understand the actual pointer
>>value remains the same, so as long as you are in the context of the
>>userspace program that gave you the pointer, the VMT should correctly
>>interpret it right?
>>
>>So what exactly is so bad about dereferencing userspace pointers?
>=20
> The page may not be mapped, for example if it has been swapped out. The
> copy_to_user() and copy_from_user() macros are specifically designed to
> handle that: they add an entry in an exception table, which is read by
> the page fault handler. An entry in that exception table says to the
> page fault handler "yeah, ok, a page fault occured from the kernel, but
> it's perfectly controlled, it's inside a copy_from_user() or
> copy_to_user() macro".

Ok.  Note that although I did an "Operating Systems" course during my
university years I still don't think I'm up to scratch, which is why I
lurk (mostly) on this mailing list, no real need for the kernel-level
knowledge, but some really interresting stuff none the less.  Anyhow, my
understanding of page-faults is that the MMU (yea, I live in an x86/64
world so other architectures may have different names for things)
generates an interrupt (Of the non-maskable kind?) to the CPU which then
gets handled by the kernel by suspending that process after scheduling
the required page to be swapped back in, or in the worst case, killing
the process with SIGSEGV if no such page exists for the process.  So I
guess this flags two guestions:

1.  What prevents the kernel page fault handler from doing the same?
2.  Would that even be sane?

For question one, let's assume a 3GB/1GB memory split for user/kernel
memory, what then prevents the page-fault-handler from checking in which
"half" the pointer is, if it's in the top 1GB (kernel land) then kernel
panic as is currently the case as that memory can obviously not be paged
in (kernel memory as far as I understand it is stuck in real memory).
If however, we are in the bottom 3GB, grab the page table for the
current task, and check whether it would be possible to swap in the
appropriate pages (I'm guessing this is what copy_{to,from}_user
essentially does).

However, based on what could all go wrong I'm guessing there are just
way too many cases to cover.  For example, what if we keep a reference
of that pointer which is then later used in "pure" kernel context
(interrupt of sorts?) or even in another task context.  This would be bad.

Or what happens if we have a spinlock of sorts, or a mutex or any other
type of lock which now gets hold because the execution is first sent on
a side-trip?  For that matter, what currently happens with
copy_{to,from}_user should this happen?

What happens if that memory cannot be made available?  SIGSEGV and
termination of the entire task?  What about locks or does
copy_{to,from}_user return error codes indicating failure which can then
be percolated up the call chain until the system call eventually returns
an error, and of course at which point any pending (SIGSEGV) signals
gets delivered?

> Without an entry in the exception table (which would be the case if you
> simply dereference an userspace pointer in the kernel code), then you
> would get a panic from the page fault handler if the page has been
> unmapped for some reason (not yet mapped, swapped out, or whatever).

Sounds like a sane way to prevent all the brainwork that would be
required to allow userspace-pointer dereferences.

> You can have a look at how the copy_to_user()/copy_from_user() macros
> are implemented: they do some ELF-section trickery to add an entry in
> the exception table.

Guess I should do that.

> (Don't hesitate to correct me if I'm wrong).

Not from my side, what you said makes perfect sense.  Thanks for the
explanation.

Jaco

--------------ms010905090406050802010706
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
CQUxDxcNMDcwMTA4MTYxNTE1WjAjBgkqhkiG9w0BCQQxFgQUNqJwCKs1NdGTqSR+jhOLu/nh
v9YwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF
5x4JcaGHMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF5x4JcaGHMA0GCSqGSIb3DQEBAQUABIIB
AFGa1YAeuANsEkYPDo6p9qmgubkJh1jV0+mX0vLYRfwXViovK0NV7vDZsdsHb2vKxlIRKFuV
BbIxKU90fUO7igXefRZkkr5q/KpJ7APQC5wkoN5JEx9L98RPe98A+Uw7dMtQ8i2KWZzgaxsL
SbOLh6F6JK3voF9XBXThYrPL+o7Y3lP1v24kLev/2WNFVjvVgxQtLO4s3vY2XDEt1chb71HV
lfOBO1bZN/IR7x03KPO6qLA6OmsjIzzyFF24IUpy7yHqvbTmLrwLWc4eGv4adVdEx0k+5mQI
Pm1goC8z1nlsMHLQJMAGPAj+YN786EBgVJ/znIie1Ez2aUDozg9r+qYAAAAAAAA=
--------------ms010905090406050802010706--

--===============1678878670==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1678878670==--
