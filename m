From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2011 17:06:17 +0000
Subject: Re: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <20111215170617.GB17353@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NMuMz9nt05w80d4+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111207063848.GA14507@elgon.mountain>
In-Reply-To: <20111207063848.GA14507@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--NMuMz9nt05w80d4+
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
>=20
> What compiler are you using?  I don't think I saw warnings.
>=20

This is a Sparse warning.

regards,
dan carpenter


--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO6ikJAAoJEOnZkXI/YHqRJ6gP/RTgs63UHPAjO+F1+0eGqeit
NkjqM6kVE3XX2RI03FVBFnDKDb7CrM3o8reMMLyD4HdsaQHSYnPWljqJW/AivYCT
+W3TMvxQfyiyXKHGn9FAjIOxPn3tURMJF0IWrspUZ5R5/ykiOJ053T1zu7YluBqw
Obt31aEiWJm4VaH4FIqeolDsAYLe2p5S3aXUqVytxhLGMb3MzLc97O4PwsYXHoHP
pFT0wTJxQByKF43N3yL8vA2P3jvBpuo9gwFslW24yHDfsvPXJdkBWACYvT/fmZYW
f6Adyo5kXS74gTSguzDYtztr9Js7gvWFbB/4KY2FYQTaQ3Y2NxtBhPsCE8/JTcpr
5XXwr6+UN++KAFWtKN1jnGrDzyqNUBty2eaK1W9G2J+kZtbZROfLc3Sx19pElZky
7f2tfc0PAXbetp4F1DKJAicjcAlikbPqvoOu21fiSVx4rAzBwJInS6qt5vCLcEre
veXxFA4GaiwpBhCjZUENSiwgvYItjAaPC6hXdGWAd07Zhp8vBmdKi4WFp4mrjS0O
oxxfoZ4VSJ+flryTGf8DJV0qQAOE5YB9CIwVCgMrVPyofGyt5Wnp9DEZnRVVMedW
K386l38SuCx0DHr9V1+GQeZJzAVcxNjAMMWN0pHjNL35n4/alnqhmI1EBLXrNAbP
rl/BM3GKsTkH7La0gWaC
=hTTQ
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
