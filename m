From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Jan 2021 17:09:52 +0000
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in variable ret
Message-Id: <20210111170952.GG4728@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8bBEDOJVaa9YlTAt"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
 <02666c81-5b0b-fe48-5d9d-63f2f007bfba@canonical.com>
In-Reply-To: <02666c81-5b0b-fe48-5d9d-63f2f007bfba@canonical.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, =?utf-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org


--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 05:07:46PM +0000, Colin Ian King wrote:
> On 11/01/2021 16:35, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Just to double-check, which tree should I be working against?

The ASoC tree.

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8hl8ACgkQJNaLcl1U
h9Bd+gf7B9+Ph85InD2rpWWb23HJjI+fduw0QnvHs/tGyW/s6PcLryEZxMiDxxE/
b88tUAdO4VNP7ut/maZKSE2M7t7seO3bNJABfV7FIdu63EWbh5kRcY5Qjgv5tpPe
GR8cH+Pjj5XLiB0EuxOhLVSIYx0Cu4qCWrBc+9YUA6zHQcuYHtuCW4D0MCTxcyrA
oMB+38Q6QKYDoaaE+znyJ5AzMSPHWreQBFjKAXify5/yaRNw1kdenyt+dguGD2Po
u2OwUqcruMy8kVvU0bXJDo5iUIyybmCYLXPkpLnBsFLmDS0qq+aLjqq8QMrjWY2M
9tKAmVqv4FsN0BbKfhkT5rhKCJx37Q==
=3HiQ
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--
