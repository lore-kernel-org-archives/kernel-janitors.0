From: Denis Kirjanov <kirjanov@gmail.com>
Date: Thu, 08 Jul 2010 13:16:02 +0000
Subject: Re: [PATCH 3/4] ll_temac: free everything on error path
Message-Id: <AANLkTilm1b61ikLi28We3aLrF3Ld4c05oFZlh3K1pORe@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278591012-3213-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278591012-3213-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, John Linn <john.linn@xilinx.com>, Grant Likely <grant.likely@secretlab.ca>, Jiri Pirko <jpirko@redhat.com>, Brian Hill <brian.hill@xilinx.com>, netdev@vger.kernel.org

On Thu, Jul 8, 2010 at 4:10 PM, Kulikov Vasiliy <segooon@gmail.com> wrote:
> temac_dma_bd_init() must free all allocated resources: memory, dma, skbs.
>
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
> =A0drivers/net/ll_temac_main.c | =A0 30 +++++++++++++++++++++++++-----
> =A01 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ll_temac_main.c b/drivers/net/ll_temac_main.c
> index a2da3d7..38d658a 100644
> --- a/drivers/net/ll_temac_main.c
> +++ b/drivers/net/ll_temac_main.c
> @@ -200,6 +200,7 @@ static int temac_dma_bd_init(struct net_device *ndev)
> =A0 =A0 =A0 =A0struct temac_local *lp =3D netdev_priv(ndev);
> =A0 =A0 =A0 =A0struct sk_buff *skb;
> =A0 =A0 =A0 =A0int i;
> + =A0 =A0 =A0 int tx_bd_v_size, rx_bd_v_size;
>
> =A0 =A0 =A0 =A0lp->rx_skb =3D kzalloc(sizeof(*lp->rx_skb) * RX_BD_NUM, GF=
P_KERNEL);
> =A0 =A0 =A0 =A0if (!lp->rx_skb) {
> @@ -209,21 +210,23 @@ static int temac_dma_bd_init(struct net_device *nde=
v)
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0/* allocate the tx and rx ring buffer descriptors. */
> =A0 =A0 =A0 =A0/* returns a virtual addres and a physical address. */
> + =A0 =A0 =A0 tx_bd_v_size =3D sizeof(*lp->tx_bd_v) * TX_BD_NUM;
> =A0 =A0 =A0 =A0lp->tx_bd_v =3D dma_alloc_coherent(ndev->dev.parent,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0sizeof(*lp->tx_bd_v) * TX_BD_NUM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 tx_bd_v_size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 &lp->tx_bd_p, GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!lp->tx_bd_v) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&ndev->dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"unable to=
 allocate DMA TX buffer descriptors");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_rx_skb;
> =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 rx_bd_v_size =3D sizeof(*lp->rx_bd_v) * RX_BD_NUM;
> =A0 =A0 =A0 =A0lp->rx_bd_v =3D dma_alloc_coherent(ndev->dev.parent,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0sizeof(*lp->rx_bd_v) * RX_BD_NUM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0rx_bd_v_size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 &lp->rx_bd_p, GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!lp->rx_bd_v) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&ndev->dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"unable to=
 allocate DMA RX buffer descriptors");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_tx_bd;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0memset(lp->tx_bd_v, 0, sizeof(*lp->tx_bd_v) * TX_BD_NUM);
> @@ -242,7 +245,7 @@ static int temac_dma_bd_init(struct net_device *ndev)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (skb =3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&ndev->dev, "alloc=
_skb error %d\n", i);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_dma_single;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lp->rx_skb[i] =3D skb;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* returns physical address of skb->data */
> @@ -274,6 +277,23 @@ static int temac_dma_bd_init(struct net_device *ndev)
>
> =A0 =A0 =A0 =A0return 0;
>
> +err_dma_single:
> + =A0 =A0 =A0 for (i =3D 0; i < RX_BD_NUM; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (lp->rx_skb[i] =3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree_skb(lp->rx_skb[i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_unmap_single(ndev->dev.parent, lp->rx_b=
d_v[i].phys,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 XTE_MAX_JUM=
BO_FRAME_SIZE, DMA_FROM_DEVICE);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dma_free_coherent(ndev->dev.parent, rx_bd_v_size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lp->rx_bd_v=
, lp->rx_bd_p);
> +err_tx_bd:
> + =A0 =A0 =A0 dma_free_coherent(ndev->dev.parent, tx_bd_v_size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lp->tx_bd_v=
, lp->tx_bd_p);
> +err_rx_skb:
> + =A0 =A0 =A0 kfree(lp->rx_skb);
> =A0out:
> =A0 =A0 =A0 =A0return -ENOMEM;
> =A0}
> --
> 1.7.0.4
This is not enough. DMA resources also must be released on exit.
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Regards,
Denis
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
