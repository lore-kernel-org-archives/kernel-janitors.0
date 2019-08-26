From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Date: Mon, 26 Aug 2019 07:10:48 +0000
Subject: Re: [PATCH v2 -next] net: mediatek: remove set but not used variable 'status'
Message-Id: <20190826071048.Horde.gwS9nzceYYiYGJLnJ6-x2hz@www.vdorst.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190824.142158.1506174328495468705.davem@davemloft.net>
 <20190826013118.22720-1-maowenan@huawei.com>
In-Reply-To: <20190826013118.22720-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mao Wenan <maowenan@huawei.com>, sr@denx.de
Cc: nbd@openwrt.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, sean.wang@mediatek.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org

Let's add Stefan to the conversation.
He is the author of this commit.

Quoting Mao Wenan <maowenan@huawei.com>:

> Fixes gcc '-Wunused-but-set-variable' warning:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function mtk_handle_irq:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1951:6: warning: =20
> variable status set but not used [-Wunused-but-set-variable]
>
> Fixes: 296c9120752b ("net: ethernet: mediatek: Add MT7628/88 SoC support")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  v2: change format of 'Fixes' tag.
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c =20
> b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 8ddbb8d..bb7d623 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1948,9 +1948,7 @@ static irqreturn_t mtk_handle_irq_tx(int irq, =20
> void *_eth)
>  static irqreturn_t mtk_handle_irq(int irq, void *_eth)
>  {
>  	struct mtk_eth *eth =3D _eth;
> -	u32 status;
>
> -	status =3D mtk_r32(eth, MTK_PDMA_INT_STATUS);

Hi Stefan,

You added an extra MTK_PDMA_INT_STATUS read in mtk_handle_irq()
Is that read necessary to work properly?

Greats,

Ren=C3=A9


>  	if (mtk_r32(eth, MTK_PDMA_INT_MASK) & MTK_RX_DONE_INT) {
>  		if (mtk_r32(eth, MTK_PDMA_INT_STATUS) & MTK_RX_DONE_INT)
>  			mtk_handle_irq_rx(irq, _eth);
> --
> 2.7.4
