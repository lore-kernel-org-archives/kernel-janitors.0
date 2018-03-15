From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Mar 2018 13:36:56 +0000
Subject: [net:master 128/139] drivers/net/can/cc770/cc770.c:712 cc770_tx_interrupt() error: dereferencing fre
Message-Id: <20180315133656.a5scx5uizlotiifm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
head:   cf55612a945039476abfd73e39064b2e721c3272
commit: 746201235b3f876792099079f4c6fea941d76183 [128/139] can: cc770: Fix queue stall & dropped RTR reply

New smatch warnings:
drivers/net/can/cc770/cc770.c:712 cc770_tx_interrupt() error: dereferencing freed memory 'priv->tx_skb'

# https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?idt6201235b3f876792099079f4c6fea941d76183
git remote add net https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git
git remote update net
git checkout 746201235b3f876792099079f4c6fea941d76183
vim +712 drivers/net/can/cc770/cc770.c

2a367c3a Wolfgang Grandegger 2011-11-30  671  
2a367c3a Wolfgang Grandegger 2011-11-30  672  static void cc770_tx_interrupt(struct net_device *dev, unsigned int o)
2a367c3a Wolfgang Grandegger 2011-11-30  673  {
2a367c3a Wolfgang Grandegger 2011-11-30  674  	struct cc770_priv *priv = netdev_priv(dev);
2a367c3a Wolfgang Grandegger 2011-11-30  675  	struct net_device_stats *stats = &dev->stats;
2a367c3a Wolfgang Grandegger 2011-11-30  676  	unsigned int mo = obj2msgobj(o);
74620123 Andri Yngvason      2018-03-14  677  	struct can_frame *cf;
74620123 Andri Yngvason      2018-03-14  678  	u8 ctrl1;
74620123 Andri Yngvason      2018-03-14  679  
74620123 Andri Yngvason      2018-03-14  680  	ctrl1 = cc770_read_reg(priv, msgobj[mo].ctrl1);
2a367c3a Wolfgang Grandegger 2011-11-30  681  
2a367c3a Wolfgang Grandegger 2011-11-30  682  	cc770_write_reg(priv, msgobj[mo].ctrl0,
2a367c3a Wolfgang Grandegger 2011-11-30  683  			MSGVAL_RES | TXIE_RES | RXIE_RES | INTPND_RES);
74620123 Andri Yngvason      2018-03-14  684  	cc770_write_reg(priv, msgobj[mo].ctrl1,
74620123 Andri Yngvason      2018-03-14  685  			RMTPND_RES | TXRQST_RES | MSGLST_RES | NEWDAT_RES);
2a367c3a Wolfgang Grandegger 2011-11-30  686  
74620123 Andri Yngvason      2018-03-14  687  	if (unlikely(!priv->tx_skb)) {
74620123 Andri Yngvason      2018-03-14  688  		netdev_err(dev, "missing tx skb in tx interrupt\n");
74620123 Andri Yngvason      2018-03-14  689  		return;
74620123 Andri Yngvason      2018-03-14  690  	}
74620123 Andri Yngvason      2018-03-14  691  
74620123 Andri Yngvason      2018-03-14  692  	if (unlikely(ctrl1 & MSGLST_SET)) {
74620123 Andri Yngvason      2018-03-14  693  		stats->rx_over_errors++;
74620123 Andri Yngvason      2018-03-14  694  		stats->rx_errors++;
74620123 Andri Yngvason      2018-03-14  695  	}
74620123 Andri Yngvason      2018-03-14  696  
74620123 Andri Yngvason      2018-03-14  697  	/* When the CC770 is sending an RTR message and it receives a regular
74620123 Andri Yngvason      2018-03-14  698  	 * message that matches the id of the RTR message, it will overwrite the
74620123 Andri Yngvason      2018-03-14  699  	 * outgoing message in the TX register. When this happens we must
74620123 Andri Yngvason      2018-03-14  700  	 * process the received message and try to transmit the outgoing skb
74620123 Andri Yngvason      2018-03-14  701  	 * again.
74620123 Andri Yngvason      2018-03-14  702  	 */
74620123 Andri Yngvason      2018-03-14  703  	if (unlikely(ctrl1 & NEWDAT_SET)) {
74620123 Andri Yngvason      2018-03-14  704  		cc770_rx(dev, mo, ctrl1);
74620123 Andri Yngvason      2018-03-14  705  		cc770_tx(dev, mo);
74620123 Andri Yngvason      2018-03-14  706  		return;
74620123 Andri Yngvason      2018-03-14  707  	}
74620123 Andri Yngvason      2018-03-14  708  
74620123 Andri Yngvason      2018-03-14  709  	can_put_echo_skb(priv->tx_skb, dev, 0);
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This frees priv->tx_skb on a couple error paths.  We should just do the
accounting earlier.

2a367c3a Wolfgang Grandegger 2011-11-30  710  	can_get_echo_skb(dev, 0);
74620123 Andri Yngvason      2018-03-14  711  
74620123 Andri Yngvason      2018-03-14 @712  	cf = (struct can_frame *)priv->tx_skb->data;
74620123 Andri Yngvason      2018-03-14  713  	stats->tx_bytes += cf->can_dlc;
74620123 Andri Yngvason      2018-03-14  714  	stats->tx_packets++;
74620123 Andri Yngvason      2018-03-14  715  
74620123 Andri Yngvason      2018-03-14  716  	priv->tx_skb = NULL;
74620123 Andri Yngvason      2018-03-14  717  
2a367c3a Wolfgang Grandegger 2011-11-30  718  	netif_wake_queue(dev);
2a367c3a Wolfgang Grandegger 2011-11-30  719  }
2a367c3a Wolfgang Grandegger 2011-11-30  720  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
