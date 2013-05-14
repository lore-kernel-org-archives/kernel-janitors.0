From: Mark Brown <broonie@kernel.org>
Date: Tue, 14 May 2013 12:40:40 +0000
Subject: Re: [alsa-devel] [patch] ASoC: wm_adsp: memory leak in wm_adsp_create_control()
Message-Id: <20130514124040.GA20930@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130514120244.GA27826@elgon.mountain>
In-Reply-To: <20130514120244.GA27826@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 14, 2013 at 03:02:44PM +0300, Dan Carpenter wrote:
> There are two return paths which don't kfree(name).

Applied, thanks.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRkjDAAAoJELSic+t+oim9lA0P/3b9Z7PwOqG7UNwzTrL4pltO
0eV72djxyDgOeUyf3VcR+NgpD3DYmqKEYhn+XDG7mC2GcZ2gdvPCZKGHR/4iFVQ1
7tmnbmAtTEpvWcsbqSUuY36Vpnyxiq4JtVZqTLbCTEFZwOfKcp72FULn78L/zZrg
pMsifOAjnuDP65JoaXqbOwwPFIbiwJdh7R37q2CuWThDTl+Th8fW6OvugjyAk7WS
u0tZkJa0h2RRCStSnI3tfwJZKtFra3pIUkJuVQD9ks/EUMp7lGqm+nedtWdtjxN8
CyUncEVrozShCqyB5J/GfD0TnETlpqpdAjbKTjAaZV6uwMN5UpeGr2LZ3+UIHpNA
TA1YvRn7kxkI61Ab5xffa6uSjDxE6gHgkFDEZNoXIOrmVYHrvek8mm0pxjqzuDZ0
gT/8AqVMsoaSnIFcpgIgHZB99XUi1moeno3x9FfVuR/EqP4p6h4R02QLLk62nYG6
NpRWINSWKg9WLu67n00Pa8Rbh9tsJ0ouN1ZhZeKAh03iTQRKKTrkJ2U58cfXk+mL
CXgY4po4XB9zTGC6830pAH3SbT5R11sg0Gs2GSAf0evo/Thti6mWjuRpMe2woYsp
f3cHZ/dxw6u54w8jASn1/YDBjCroQJzPtjgtsBFsOZc3zWIYwFdb/sOYyqMCqjgz
5+11XjUZLUxOLlb8tHXl
=Y6l6
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
