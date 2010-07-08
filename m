From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 08 Jul 2010 15:24:41 +0000
Subject: Re: [PATCH 2/4] ll_temac: fix memory leak
Message-Id: <AANLkTin8F8xb5QSOB-3JwEOJLbKFTUOcyg93-SHn4mar@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278591006-3156-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278591006-3156-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, John Linn <john.linn@xilinx.com>, Jiri Pirko <jpirko@redhat.com>, Brian Hill <brian.hill@xilinx.com>, netdev@vger.kernel.org

On Thu, Jul 8, 2010 at 6:10 AM, Kulikov Vasiliy <segooon@gmail.com> wrote:
> If of_iomap() or irq_of_parse_and_map() fail then np must be freed.
>
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Looks correct to me.

g.

> ---
> =A0drivers/net/ll_temac_main.c | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/net/ll_temac_main.c b/drivers/net/ll_temac_main.c
> index 5bca20b..a2da3d7 100644
> --- a/drivers/net/ll_temac_main.c
> +++ b/drivers/net/ll_temac_main.c
> @@ -999,19 +999,22 @@ temac_of_probe(struct of_device *op, const struct o=
f_device_id *match)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_dbg(&op->dev, "MEM bas=
e: %p\n", lp->sdma_regs);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&op->dev, "unable =
to map DMA registers\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(np);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_iounmap;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0lp->rx_irq =3D irq_of_parse_and_map(np, 0);
> =A0 =A0 =A0 =A0lp->tx_irq =3D irq_of_parse_and_map(np, 1);
> +
> + =A0 =A0 =A0 of_node_put(np); /* Finished with the DMA node; drop the re=
ference */
> +
> =A0 =A0 =A0 =A0if ((lp->rx_irq =3D NO_IRQ) || (lp->tx_irq =3D NO_IRQ)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&op->dev, "could not determine irq=
s\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rc =3D -ENOMEM;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_iounmap_2;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 of_node_put(np); /* Finished with the DMA node; drop the re=
ference */
>
> =A0 =A0 =A0 =A0/* Retrieve the MAC address */
> =A0 =A0 =A0 =A0addr =3D of_get_property(op->dev.of_node, "local-mac-addre=
ss", &size);
> --
> 1.7.0.4
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
