From: Leon Romanovsky <leon@kernel.org>
Date: Fri, 16 Nov 2018 01:59:50 +0000
Subject: Re: [PATCH -next] IB/srpt: Drop pointless static qualifier in srpt_make_tpg()
Message-Id: <20181116015950.GE24359@mtr-leonro.mtl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jTMWTj4UTAEmbWeb"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 15, 2018 at 10:55:00AM +0000, YueHaibing wrote:
> From: Yue Haibing <yuehaibing@huawei.com>
>
> There is no need to have the 'struct se_portal_group *tpg' variable
> static since new value always be assigned before use it.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJb7iSWAAoJEORje4g2clinZDwQALillXu6HGalcFKrWar5Xw9G
g+43V24uOPFoNBAu4iKoh7oE/FT46n+XizKs6FSeswYZkAY7lQDdMgHPsEnRb8IY
k3Ase/zG5oRIcDa8A4HH9hMEfyKng7njYvVYTEA0AI+RzCbzagHZpD1Pt00bR05G
y0mBEd8YmxwVU92DQZ9wozKwFnuBddV/j4dCEOezCjCUL/i7Rjm8MZLEF04oCJN7
xqOotuuNvJjlcqJ1ph3kVKzPmikKuW1si620r2mX/TaYvxWvTC8+RllC5BemCirX
INTQ6zlpQHbV2uwh3Y9Jl0rSN6uiPrL+rc2KwmNYSPiWotyWqTQDsfo+a4dAnR3D
HqAzB0anNrrI/qVfKR2tRRYneKwV0eXbOjSLkrIazAvDlV3/4zEA4u8IabaHTQIg
zsuxj62i2QTZEbhjvYpQiU/BvptulEcLeLhi+LSum58uz9kKWiHDOZFdEOzKufBj
zHMLFF1fWKj6XIRl08cLLDxXQs85j8eAa+8QkN0FXv2xoPWgcsRQY3jACldZIfdF
Y88fwswA0/+5yFKTqV0Jj1KSeflnTbb5/jU4EJ2AOZzCXp++MbcORJWxdumfqesk
daJZCF6AoDYjJRmL6x0RyPYAmDoBXDkYqfvYcZ3kO1Mu6X00yzQH8oNhFzTVgGbP
AD1I6SZYHLMNACWmO+Md
=0lg8
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
