From: Christophe LEROY <christophe.leroy@c-s.fr>
Date: Sat, 08 Oct 2016 07:20:09 +0000
Subject: Re: [PATCH] wan/fsl_ucc_hdlc: Fix size used in dma_free_coherent()
Message-Id: <cceecca5-4085-5c7b-3f94-c2b238619fa8@c-s.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475873927-14999-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1475873927-14999-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, qiang.zhao@nxp.com, David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org



Le 07/10/2016 =E0 22:58, Christophe JAILLET a =E9crit :
> Size used with 'dma_alloc_coherent()' and 'dma_free_coherent()' should be
> consistent.
> Here, the size of a pointer is used in dma_alloc... and the size of the
> pointed structure is used in dma_free...
>
> This has been spotted with coccinelle, using the following script:
> ////////////////////
> @r@
> expression x0, x1, y0, y1, z0, z1, t0, t1, ret;
> @@
>
> *   ret =3D dma_alloc_coherent(x0, y0, z0, t0);
>     ...
> *   dma_free_coherent(x1, y1, ret, t1);
>
>
> @script:python@
> y0 << r.y0;
> y1 << r.y1;
>
> @@
> if y1.find(y0) =3D -1:
>  print "WARNING: sizes look different:  '%s'   vs   '%s'" % (y0, y1)
> ////////////////////
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Untested

I don't think the error is in the dma_free_coherent() calls.

The issue is for me in the dma_alloc_coherent() call. This call is=20
supposed to allocate a table of buffer descriptors, not a table of=20
pointers to BDs.

Later in the code, this is used the following way:

		iowrite16be(bd_status, &priv->rx_bd_base[i].status);

So it is the allocation which should be

	priv->rx_bd_base =3D dma_alloc_coherent(priv->dev,
				RX_BD_RING_LEN * sizeof(struct qe_bd),
				&priv->dma_rx_bd, GFP_KERNEL);

Christophe

> ---
>  drivers/net/wan/fsl_ucc_hdlc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdl=
c.c
> index 5fbf83d5aa57..65647533b401 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -295,11 +295,11 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
>  	qe_muram_free(priv->ucc_pram_offset);
>  free_tx_bd:
>  	dma_free_coherent(priv->dev,
> -			  TX_BD_RING_LEN * sizeof(struct qe_bd),
> +			  TX_BD_RING_LEN * sizeof(struct qe_bd *),
>  			  priv->tx_bd_base, priv->dma_tx_bd);
>  free_rx_bd:
>  	dma_free_coherent(priv->dev,
> -			  RX_BD_RING_LEN * sizeof(struct qe_bd),
> +			  RX_BD_RING_LEN * sizeof(struct qe_bd *),
>  			  priv->rx_bd_base, priv->dma_rx_bd);
>  free_uccf:
>  	ucc_fast_free(priv->uccf);
> @@ -688,7 +688,7 @@ static void uhdlc_memclean(struct ucc_hdlc_private *p=
riv)
>
>  	if (priv->rx_bd_base) {
>  		dma_free_coherent(priv->dev,
> -				  RX_BD_RING_LEN * sizeof(struct qe_bd),
> +				  RX_BD_RING_LEN * sizeof(struct qe_bd *),
>  				  priv->rx_bd_base, priv->dma_rx_bd);
>
>  		priv->rx_bd_base =3D NULL;
> @@ -697,7 +697,7 @@ static void uhdlc_memclean(struct ucc_hdlc_private *p=
riv)
>
>  	if (priv->tx_bd_base) {
>  		dma_free_coherent(priv->dev,
> -				  TX_BD_RING_LEN * sizeof(struct qe_bd),
> +				  TX_BD_RING_LEN * sizeof(struct qe_bd *),
>  				  priv->tx_bd_base, priv->dma_tx_bd);
>
>  		priv->tx_bd_base =3D NULL;
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
