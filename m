From: Wolfram Sang <wsa@the-dreams.de>
Date: Fri, 12 Aug 2016 16:32:05 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <20160812163205.GA1599@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Kj7319i9nmIyA2yE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <901acc3c-ff1b-6f0c-b744-2bfb36de18d8@users.sourceforge.net>
 <1468787163.1900.1.camel@perches.com>
 <20160720155500.GG1688@katana>
 <5911a2e6-6862-7b72-b69a-dcc32658b85b@users.sourceforge.net>
 <20160811070502.GA1665@katana>
 <1ae7a67e-8fd4-3b37-7045-e60707df11d0@users.sourceforge.net>
In-Reply-To: <1ae7a67e-8fd4-3b37-7045-e60707df11d0@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Nothing what I would find noteworthy for increasing the usage of a functi=
on
> like "dev_err".
>=20
> Are you on "a mission" to improve software around logging calls a bit mor=
e?

I have two of those cards and I would like to know which one caused an
error. dev_err helps with exactly that.


--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBAgAGBQJXrfoFAAoJEBQN5MwUoCm21NsP+PTUiigfuXyjFMAQLrIlZeKK
wvvOgcgadkFtu0kxkz7kbkNzufowBbkxi12dmahfevuvKI+TbmkUeGOUYLiRzFnF
F0GnC2lGGEehmlCGmftYq1hNRbooWaYGZLGSYva6uEGJjwE1l0TtxiJRPTz2pUsB
HmTatH90O3x7qAmG6E3flJbSvMmaSsjEuorO7/jXAomtumLZg6BDYcypayX6cswX
epxh2tNok44wL5ejxSoAIybxsIou+Vb2X4dYJgWe7wBb5PV9KrGKjfVN6NF1bejF
b8IwTGx0X8CuF0c74KzyxyM0Q0qfwCAbIpvZX6YZcTZTViQ0/wHzal5BAKdcEaUO
0tocr7tmMoaoaR42YWqqhjw/kkEAimHbegUJ4Hgpfo62OUaJ79RH186YtsdlvCZR
xYapucxQuQZchm9u+I95AnxHvpKS8Wgs62l7T2yI1bQyyw/e4SKw5oxbC0j9rHlv
yhLOE3c69YB2XTEeDe6IyVfsBKpI5uL0HB6dPY84iqJ3sPHcOCkU91T+qcKzr0bh
MTASAl47dfVe5TAdYibI/RGQ9sDaFww3ET7JxnlfDlcpb4bv74xPs5KE/xuq5JAR
mp4GrOsS81/o4g0ed7QfFc4XCgxqCvptQm7sbPUoXHnIYKKHg+uvlZbdPvfHUZ4z
WtdaCWgudPe+Gb9FG38=
=kSAu
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
