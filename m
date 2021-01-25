From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Date: Mon, 25 Jan 2021 11:13:26 +0000
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Fix a resource leak in an error handling path
Message-Id: <f0b99332-fcac-093a-5f9e-997c9955ad7c@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210124070923.724479-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210124070923.724479-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dan.j.williams@intel.com, vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 1/24/21 9:09 AM, Christophe JAILLET wrote:
> In 'dma_pool_create()', we return -ENOMEM, but don't release the resources
> already allocated, as in all the other error handling paths.
>=20
> Go to 'err_res_free' instead of returning directly.

Interesting that I only had error for the bcdma path...

> Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDM=
A")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is not even compile tested.
> I don't have the needed configuration.

No issue, that patch is trivial,

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> ---
>   drivers/dma/ti/k3-udma.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 8e3fd1119a77..96ad21869ba7 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -2447,7 +2447,8 @@ static int bcdma_alloc_chan_resources(struct dma_ch=
an *chan)
>   			dev_err(ud->ddev.dev,
>   				"Descriptor pool allocation failed\n");
>   			uc->use_dma_pool =3D false;
> -			return -ENOMEM;
> +			ret =3D -ENOMEM;
> +			goto err_res_free;
>   		}
>  =20
>   		uc->use_dma_pool =3D true;
>=20

--=20
P=C3=A9ter
