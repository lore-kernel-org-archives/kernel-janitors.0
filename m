From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 06:41:06 +0000
Subject: Re: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <20120104064106.GD3557@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7DO5AaGCk89r4vaK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111207063848.GA14507@elgon.mountain>
In-Reply-To: <20111207063848.GA14507@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 08:38:01AM -0800, Andy Lutomirski wrote:
> On Thu, Dec 15, 2011 at 5:45 AM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > Andy, this is your code from:
> >
> > commit 4fc3490114bb159bd4fff1b3c96f4320fe6fb08f
> > Author: Andy Lutomirski <luto@amacapital.net>
> > Date: =A0 Mon Nov 7 16:33:40 2011 -0800
> >
> > =A0 =A0x86-64: Set siginfo and context on vsyscall emulation faults
> >
> > Would you like to comment on what we should do here? =A0These warnings
> > are spamming my build.
>=20
> I'm fine with either, but I slightly prefer bool.

Earlier on in the thread we considered doing that, but I wasn't
sure if these headers were exported to userspace and if that makes
a difference.  Can you comment on that?

regards,
dan carpenter


--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPA/SCAAoJEOnZkXI/YHqR2ZkP/RPeILa7SjzIQC4uMKYvcYf8
kc+9TSscHGreyTOKi3SvFFQ1zQJz5VL5I4r2JxShz+hTRS5TVRnn0low+/4TMKt+
ZaES8bpGdHQ8HE4ceWugSmoQ6Lto8Nm3FcOETU2NEcxT74f0VqAxLx8e2QPqcEoM
fr+sEjcyyKWozYHh6Os4DkMOn8bcVCpDR75y6/jLtyA+yKAgeXgt5/6iaQ/iunza
NM/j1EXjVcnlJ2YPHGXeY+NtDH89gK7Af/0aDr6BnKw0KJiNfPfAxfbR6jwD0oxE
7THl9W2GKYkOBjP3SWp6OE4X3EUTMyABo92zK7HbZXeKtAqJ/zIHKudqxVtPl0Gx
oD429qN4X6p4YH5OiI8mPF1oWb/8AqhRToP6+OXPzanf8st4Ix7PI7RUy+RL01SP
D1KrzQQCv5KWR+b9cSNj5oPw+zxcY7FxW/G+/n4PpQvU0yi2NLd0+KBDZEaMJAV7
TNUho5lRuR306ICcsJUsGKY0ObFaYIzMCgnui5ZE8+w/eZo2g26vCXXs+0p6AWxl
3sysQc/XISIITSAUXYmyFWWrHyf5ftUmCKslO2GoQqnSNADvWbLEe6RPamiHsyQF
Ca8wUT9+fByNmmef4yDaVDxQGkFMQWVtP0LnVWjuolwcoV8HiIKfLWV0CKaChmZX
63qAXC3sw85AsLCZ03Un
=WtzS
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
