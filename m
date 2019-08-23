From: Scott Branden <scott.branden@broadcom.com>
Date: Fri, 23 Aug 2019 16:10:02 +0000
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_ethernet=3a_Delete_unnecessary_checks_b?= =?UTF-8?Q?efore_the_macro_call
Message-Id: <c90f0649-0dc0-df9a-21e6-ae6566ca5935@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
 <4ab7f2a5-f472-f462-9d4c-7c8d5237c44e@wanadoo.fr>
In-Reply-To: <4ab7f2a5-f472-f462-9d4c-7c8d5237c44e@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, intel-wired-lan@lists.osuosl.org, bcm-kernel-feedback-list@broadcom.com, UNGLinuxDriver@microchip.com, Alexandre Torgue <alexandre.torgue@st.com>, Alexios Zavras <alexios.zavras@intel.com>, Allison Randal <allison@lohutok.net>, Bryan Whitehead <bryan.whitehead@microchip.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Douglas Miller <dougmill@linux.ibm.com>, Florian Fainelli <f.fainelli@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Jilayne Lovejoy <opensource@jilayne.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Jose Abreu <joabreu@synopsys.com>, Kate Stewart <kstewart@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


On 2019-08-23 7:08 a.m., Christophe JAILLET wrote:
> Hi,
>
> in this patch, there is one piece that looked better before. (see below)
>
> Removing the 'if (skb)' is fine, but concatening everything in one 
> statement just to save 2 variables and a few LOC is of no use, IMHO, 
> and the code is less readable.
Agreed.
>
> just my 2c.
>
>
> CJ
>
>
> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c 
> b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index d3a0b614dbfa..8b19ddcdafaa 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -2515,19 +2515,14 @@ static int bcmgenet_dma_teardown(struct 
> bcmgenet_priv *priv)
>  static void bcmgenet_fini_dma(struct bcmgenet_priv *priv)
>  {
>      struct netdev_queue *txq;
> -    struct sk_buff *skb;
> -    struct enet_cb *cb;
>      int i;
>
>      bcmgenet_fini_rx_napi(priv);
>      bcmgenet_fini_tx_napi(priv);
>
> -    for (i = 0; i < priv->num_tx_bds; i++) {
> -        cb = priv->tx_cbs + i;
> -        skb = bcmgenet_free_tx_cb(&priv->pdev->dev, cb);
> -        if (skb)
> -            dev_kfree_skb(skb);
> -    }
> +    for (i = 0; i < priv->num_tx_bds; i++)
> + dev_kfree_skb(bcmgenet_free_tx_cb(&priv->pdev->dev,
> +                          priv->tx_cbs + i));
>
>      for (i = 0; i < priv->hw_params->tx_queues; i++) {
>          txq = netdev_get_tx_queue(priv->dev, priv->tx_rings[i].queue);
