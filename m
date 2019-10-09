From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 09 Oct 2019 12:13:49 +0000
Subject: Re: [PATCH -next] crypto: Use PTR_ERR_OR_ZERO in safexcel_xcbcmac_cra_init()
Message-Id: <20191009121349.GA2969@kwain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009120621.45834-1-yuehaibing@huawei.com>
In-Reply-To: <20191009120621.45834-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: Antoine Tenart <antoine.tenart@bootlin.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 09, 2019 at 12:06:21PM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Antoine Tenart <antoine.tenart@ack.tf>

Thanks,
Antoine

> ---
>  drivers/crypto/inside-secure/safexcel_hash.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypt=
o/inside-secure/safexcel_hash.c
> index 85c3a075f283..a07a2915fab1 100644
> --- a/drivers/crypto/inside-secure/safexcel_hash.c
> +++ b/drivers/crypto/inside-secure/safexcel_hash.c
> @@ -2109,10 +2109,7 @@ static int safexcel_xcbcmac_cra_init(struct crypto=
_tfm *tfm)
> =20
>  	safexcel_ahash_cra_init(tfm);
>  	ctx->kaes =3D crypto_alloc_cipher("aes", 0, 0);
> -	if (IS_ERR(ctx->kaes))
> -		return PTR_ERR(ctx->kaes);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(ctx->kaes);
>  }
> =20
>  static void safexcel_xcbcmac_cra_exit(struct crypto_tfm *tfm)
>=20
>=20
>=20
>=20
>=20

--=20
Antoine T=E9nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
