From: Claudiu Manoil <claudiu.manoil@nxp.com>
Date: Mon, 27 Jan 2020 11:43:10 +0000
Subject: RE: [PATCH] gianfar: Allocate the correct number of rx queues in 'gfar_of_init()'
Message-Id: <AM6PR04MB47745F475F454DC598A8D771960B0@AM6PR04MB4774.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126092028.14246-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200126092028.14246-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

>-----Original Message-----
>From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>Sent: Sunday, January 26, 2020 11:20 AM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>; davem@davemloft.net
>Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-
>janitors@vger.kernel.org; Christophe JAILLET
><christophe.jaillet@wanadoo.fr>
>Subject: [PATCH] gianfar: Allocate the correct number of rx queues in
>'gfar_of_init()'
>
>We can get values for rx and tx queues from "fsl,num_rx_queues" and
>"fsl,num_tx_queues". However, when 'alloc_etherdev_mq()' is called, the
>value for "tx" is used for both.
>
>Use 'alloc_etherdev_mqs()' instead.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>---
>WARNING: This patch is purely speculative!
>
>I don't fully understand the code, and tx and rx queues seem to be
>allocated by 'gfar_alloc_[rt]x_queues()' and handled with priv-> fields.
>I don't know the relationship between queues provided by the core, and the
>ones specificly handled in this driver.
>
>'netif_set_real_num_rx_queues()' a few lines below is also spurious to me.
>If "fsl,num_rx_queues" > "fsl,num_tx_queues" it will return an error and
>things then look out of synch (i.e. 'priv->num_rx_queues' is set to a value
>bigger than what is allocated by core, that is to say the one from
>'priv->num_tx_queues')
>
>If my assumptions are correct, I guess that the call to
>'netif_set_real_num_rx_queues()' is useless
>
>
>Sorry for the noise if I'm completly wrong.
>In such a case, some explanation would be appreciated.

Your patch is reasonable, you rightly noticed that something is amiss, 
we could reasonably say that:
Fixes: fba4ed030cfa ("gianfar: Add Multiple Queue Support")

But the fix doesn't change the behavior of the current mainline code.  That's because
in the current mainline code num_rx_qs is always equal to num_tx_qs, and both can be
either 1 or 2, depending on whether the platform has 1 or 2 CPUs.  The GFAR_MQ_POLLING
mode option is never set, not on the mainline at least (you can look up this define in the code
for comments).  As it is now, the GFAR_MQ_POLLING option can be activated by adding an extra
if statement in the driver, to select it by a special device tree compatibility string for example.

So, the problem is that this option to support more than 2 Rx and 2 Tx queues in the mainline code
cannot be accessed without modifying the driver.  Supporting more than 2 queues has shown
considerable overhead in the past.  So the decision was made to support only one pair of 
Rx/Tx queues per CPU by default.  However there's no easy way to change these defaults at
runtime, and switch to GFAR_MQ_POLLING.  And so far I received no feedback/ request to support
GFAR_MQ_POLLING upstream.  So I see several options here: 1) remove the GFAR_MQ_POLLING
code (something I was about to do 6 years ago, but I was prompted to leave it there), 2) come up
with a way to activate it at runtime, 3) add support to activate it at probe time via new device tree
properties /strings (not ideal).  Any suggestion?

Thanks,
Claudiu
