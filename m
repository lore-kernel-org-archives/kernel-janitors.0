From: Wolfram Sang <w.sang@pengutronix.de>
Date: Thu, 26 Jan 2012 11:05:06 +0000
Subject: Re: [alsa-devel] [PATCH 1/15] sound/soc/mxs/mxs-saif.c: add missing iounmap
Message-Id: <20120126110506.GB2611@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i0/AhcQY5QxfSsSZ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-1-git-send-email-Julia.Lawall@lip6.fr>
	<7FE21149F4667147B645348EC605788508FBDB@039-SN2MPN1-013.039d.mgd.msft.net>
	<alpine.DEB.2.02.1201241828480.1779@localhost6.localdomain6>
	<20120124202203.GD1135@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201242144580.1998@hadrien>
In-Reply-To: <alpine.DEB.2.02.1201242144580.1998@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng-B29396 <B29396@freescale.com>, Liam Girdwood <lrg@ti.com>


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> @@ -666,18 +666,19 @@ static int mxs_saif_probe(struct platform_device *p=
dev)
>   		goto failed_get_resource;
>   	}
>=20
> -	if (!request_mem_region(iores->start, resource_size(iores),
> -				"mxs-saif")) {
> +	if (!devm_request_mem_region(&pdev->dev, iores->start,
> +				     resource_size(iores), "mxs-saif")) {
>   		dev_err(&pdev->dev, "request_mem_region failed\n");
>   		ret =3D -EBUSY;
>   		goto failed_get_resource;
>   	}
>=20
> -	saif->base =3D ioremap(iores->start, resource_size(iores));
> +	saif->base =3D devm_ioremap(&pdev->dev, iores->start,
> +				  resource_size(iores));

devm_request_and_ioremap() to save even more code?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8hM2IACgkQD27XaX1/VRvl4wCeIArqrtl8+wIySL0w/s4TqXzx
lqEAnAhHR20GfGR2Q7lfl1+fj7lcw7Z2
=Skak
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
