From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 04 Nov 2015 13:53:49 +0000
Subject: Re: [patch] dmaengine: edma: predecence bug in GET_NUM_QDMACH()
Message-Id: <563A0DED.1040606@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104133831.GH20966@mwanda>
In-Reply-To: <20151104133831.GH20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/04/2015 03:38 PM, Dan Carpenter wrote:
> The current code uses bits 0-2 instead of 4-6 as the comment says.
>
> Fixes: 633e42b8c546 ('dmaengine: edma: Get qDMA channel information from =
HW also')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

True, I did not noticed this since we are not using qDMA in Linux right now.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
> diff --git a/drivers/dma/edma.c b/drivers/dma/edma.c
> index 31722d4..ba5eb17 100644
> --- a/drivers/dma/edma.c
> +++ b/drivers/dma/edma.c
> @@ -107,7 +107,7 @@
> =20
>  /* CCCFG register */
>  #define GET_NUM_DMACH(x)	(x & 0x7) /* bits 0-2 */
> -#define GET_NUM_QDMACH(x)	(x & 0x70 >> 4) /* bits 4-6 */
> +#define GET_NUM_QDMACH(x)	((x & 0x70) >> 4) /* bits 4-6 */
>  #define GET_NUM_PAENTRY(x)	((x & 0x7000) >> 12) /* bits 12-14 */
>  #define GET_NUM_EVQUE(x)	((x & 0x70000) >> 16) /* bits 16-18 */
>  #define GET_NUM_REGN(x)		((x & 0x300000) >> 20) /* bits 20-21 */
>=20


--=20
P=E9ter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
