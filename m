From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Oct 2015 19:00:37 +0000
Subject: re: net: Microchip encx24j600 driver
Message-Id: <20151006190037.GA31786@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jon Ringle,

This is a semi-automatic email about new static checker warnings.

The patch 04fbfce7a222: "net: Microchip encx24j600 driver" from Oct 
1, 2015, leads to the following Smatch complaint:

drivers/net/ethernet/microchip/encx24j600.c:313 encx24j600_tx_complete()
	 warn: variable dereferenced before check 'priv->tx_skb' (see line 307)

drivers/net/ethernet/microchip/encx24j600.c
   306	
   307		dev->stats.tx_bytes += priv->tx_skb->len;
                                       ^^^^^^^^^^^^
Unchecked dereference.

   308	
   309		encx24j600_clr_bits(priv, EIR, TXIF | TXABTIF);
   310	
   311		netif_dbg(priv, tx_done, dev, "TX Done%s\n", err ? ": Err" : "");
   312	
   313		if (priv->tx_skb) {
                    ^^^^^^^^^^^^
Too late.

   314			dev_kfree_skb(priv->tx_skb);
   315			priv->tx_skb = NULL;

regards,
dan carpenter
