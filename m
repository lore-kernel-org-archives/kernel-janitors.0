From: Wolfram Sang <w.sang@pengutronix.de>
Date: Tue, 06 Apr 2010 00:06:24 +0000
Subject: Re: i2c-drivers: Remove dangling pointers
Message-Id: <20100406000624.GA2893@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de> <20100405225925.GC32401@fluff.org.uk>
In-Reply-To: <20100405225925.GC32401-elnMNo+KYs3pIgCt6eIbzw@public.gmane.org>
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

> > here is a patch series fixing I2C drivers which free their private data
> > structure and leave the clientdata pointer dangling or do the cleanup i=
n the
> > wrong order. All occurences were found using coccinelle [1] and the sem=
antic
> > patch below. The matches have been reviewed, and sometimes adapted.

[...]

> From the list of things here, there's nothing in here that I should be
> worried about (just checking) ?

Correct. Just ignore this series.

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAku6ewAACgkQD27XaX1/VRvttgCgin2BILMMKf22Dl1cEG/KCBi/
UcEAn2btQWLqN9K0+4x7hl1iT22zsRlp
=nHqp
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
