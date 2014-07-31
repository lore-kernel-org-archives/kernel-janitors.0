From: Mark Brown <broonie@kernel.org>
Date: Thu, 31 Jul 2014 19:27:25 +0000
Subject: Re: [patch] ASoC: pxa: pxa-ssp: small leak in probe()
Message-Id: <20140731192725.GN17528@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="F6eHirymJZHcVyJm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731125751.GA31539@mwanda>
In-Reply-To: <20140731125751.GA31539@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Miao <eric.y.miao@gmail.com>, Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org


--F6eHirymJZHcVyJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 31, 2014 at 03:57:51PM +0300, Dan Carpenter wrote:
> There is a small memory leak if probe() fails.

Applied, thanks.

--F6eHirymJZHcVyJm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2piaAAoJELSic+t+oim9GkcP/RqnklzisQ7VC+GQu+nd8494
XxmcC27O0YyTsXUe+idCnqIQ2FWpgjkItbiX//sCXZStE6kd8jV7Jm+9oZpTonmk
rLyT5MEiHVwMTcIYAG45jhFSgknpus6wYXTVkIJrmKYvs9AFoHwWqCb21+3YXYS+
lGE2KgSwAxVDMrdat8N0ClKJi8TCfcimkju1S6IxGBVniYq8fqrv9Wa+g/prfsum
fF7Ap3L8ksop9jV+HNVomKeddUo5SUilInnw7Pt4PW61uz+G8a25UlPQr8kRNctQ
tuJSPYz3PtPkNNkOd21fNQOVYWkC1poQAe8Fe2XCv4NItQRaE55keJT3Eoiumi+H
rWxqtpoiX++e73C2GWTrGGjQ06nxPqfj4Pq4IlVrumyl+AAM62sKKBQS3Ftsyy6l
lfIyR8P4Ii3odtAbF0Putacqyabjb3RiViHObH3WP2j6+LE7ARqObFTyY8PxNe7j
44M1hPUFCflYE+4PkuYyxf6pu5CI7jzcmm5XZhIUb5xAuW5l3NHlK34dOvV5HdwT
fvYjbFiU5JIJPsXY9sXCKVbnn6DXloTaji1eVsmn0fmCtP2iuK4Pf0xoQkO2tLJU
YRyEn1ecigk6OBJev0gN+96GCWyIpbaCj8kjTGNrJuNbn7qQ+XflZ2HePasii4TW
6qkH9+P0qLWe4g0D2mOb
=ncQr
-----END PGP SIGNATURE-----

--F6eHirymJZHcVyJm--
