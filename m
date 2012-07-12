From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Thu, 12 Jul 2012 17:27:25 +0000
Subject: Re: [patch] Extcon: Arizona: unlock on an error in arizona_micdet()
Message-Id: <20120712172725.GA9270@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063602.GG11812@elgon.mountain>
In-Reply-To: <20120711063602.GG11812@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 12, 2012 at 06:19:29PM +0200, walter harms wrote:

> >  	if (ret != 0) {
> >  		dev_err(arizona->dev, "Failed to read MICDET: %d\n", ret);
> > +		mutex_unlock(&info->lock);
> >  		return IRQ_NONE;

> normally you unlock before dev_err() and is the msg ok ?

No, that's really unusual as it can make the trace much harder to follow
if there's any contention.

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAEBAgAGBQJP/wjUAAoJEBus8iNuMP3dUf8P+JHrKvC7chpIaUheqJzTyCOL
CFt8VhETslpJdrpnt5xJlpn4A6e5wIoXHC2PENbCcqAmShYfXgWJInJ+Q51CyxCb
i/jK0c9rp9DZj5dNfZtVCLS3kB2ocgSdbI923RjphkXKB8KK3XGe5LsAO38vDW0Z
aUvr60msA3sYv6QpbrXltWOwyBppS8Wg2E9iz1hoFxmcPxIeT6Q3lqvrdWnlv7t9
zp2A/P962S8cpUZV1uQFoCD1X+3sfCL/GxaBAwoAG6hvxPwz3ZnoEu0c9OBDyPJM
zNbuRvgFZpJrqm9cA1v+RTFVyz3uMRjQM9IxFzakrV36SHBvjau0BebJumpJuQfP
MViAFWfMda297+AmcedegYLn9HLLF2xaTHgdKEBFDaUPyE1zkIqUfcLmSipEKofi
jjv/FTMtDSNOYkagphMbsXB/WLRLyxKT4d5YOblE1nJ8YPc675IQnliFjLbm0N9a
rb/+C+ARtfU4BD+9qKqeWMKc1641foOOclu2yk5kq7oBz54AFgvOa3LiUMIXOyb4
7nvr0aYb2M/vBCII5uZnueT2eoNVk2QHxqWitHXnvwkmp9vDmP83tZxA6fiO3Q1F
T79JQGQ7K1NKh9ViPTJM/FBzMz8E6QuOWmBkl9CI0uRNlLqKrjYAPN97K/tgyDxg
1IcCZppMu8yGhFuQ/ZQ=
=wXuQ
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
