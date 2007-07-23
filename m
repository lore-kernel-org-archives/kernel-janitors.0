From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Mon, 23 Jul 2007 15:13:07 +0000
Subject: Re: [PATCH] dev->priv to netdev_priv(dev), drivers/net/tokenring/
Message-Id: <Pine.LNX.4.64.0707231712120.32367@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r6mzmf6q.fsf@wanadoo.fr>
In-Reply-To: <87r6mzmf6q.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


On Jul 23 2007 15:18, Yoann Padioleau wrote:
>
>Here is an excerpt of the semantic patch that performs the transformation
>
>@@
>
>- (T*) dev->priv
>+ netdev_priv(dev)

Note that dev->priv is a void*, and hence does not need casting.
So dev->priv may also appear without one.

> {
> 
>-	struct xl_private *xl_priv = (struct xl_private *)dev->priv ; 
>+	struct xl_private *xl_priv = netdev_priv(dev) ; 
> 	struct xl_tx_desc *txd ; 
> 	u8 __iomem *xl_mmio = xl_priv->xl_mmio ; 
> 	int i ; 

	Jan
-- 
