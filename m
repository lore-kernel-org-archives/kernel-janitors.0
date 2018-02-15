From: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>
Date: Thu, 15 Feb 2018 07:45:12 +0000
Subject: Re: [PATCH 1/2] crypto: caam: Delete an error message for a failed memory allocation in seven functi
Message-Id: <VI1PR0402MB334251AFB6F45F48F0A5C32898F40@VI1PR0402MB3342.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9a9a602d-93da-457d-c37d-2acbb4b7b5d5@users.sourceforge.net>
 <594d974d-577d-353d-9e99-4f98ad911cb4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2/14/2018 8:31 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 18:22:38 +0100
>=20
> Omit an extra message for a memory allocation failure in these functions.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>

though please consider the following

> @@ -689,10 +687,8 @@ static struct ahash_edesc *ahash_edesc_alloc(struct =
caam_hash_ctx *ctx,
>  	unsigned int sg_size =3D sg_num * sizeof(struct sec4_sg_entry);
> =20
>  	edesc =3D kzalloc(sizeof(*edesc) + sg_size, GFP_DMA | flags);
> -	if (!edesc) {
> -		dev_err(ctx->jrdev, "could not allocate extended descriptor\n");
> +	if (!edesc)
>  		return NULL;
> -	}
> =20
With this change, ctx parameter is no longer used in ahash_edesc_alloc().
Either here on in a different patch the function should be updated.

Thanks,
Horia
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
