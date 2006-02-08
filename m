From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 08 Feb 2006 11:07:44 +0000
Subject: Re: [KJ] [Patch] BUG_ON() Conversion in drivers/net/
Message-Id: <1139396864.15424.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46746193818869686=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============46746193818869686==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> I think unlikely can be removed here.

thanks, shouldnt do trivial patches after a day of studying :)

Here is the updated version.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc2-git2/drivers/net/e1000/e1000_main.c.orig	2006-02-07 21:40:27.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/e1000/e1000_main.c	2006-02-07 21:40:45.000000000 +0100
@@ -3419,8 +3419,7 @@ e1000_clean(struct net_device *poll_dev,
 
 	while (poll_dev != &adapter->polling_netdev[i]) {
 		i++;
-		if (unlikely(i == adapter->num_rx_queues))
-			BUG();
+		BUG_ON(i == adapter->num_rx_queues);
 	}
 
 	if (likely(adapter->num_tx_queues == 1)) {
--- linux-2.6.16-rc2-git2/drivers/net/tg3.c.orig	2006-02-07 21:41:02.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/tg3.c	2006-02-07 21:42:54.000000000 +0100
@@ -1038,8 +1038,7 @@ static void tg3_frob_aux_power(struct tg
 		struct net_device *dev_peer;
 
 		dev_peer = pci_get_drvdata(tp->pdev_peer);
-		if (!dev_peer)
-			BUG();
+		BUG_ON(!dev_peer);
 		tp_peer = netdev_priv(dev_peer);
 	}
 
@@ -2913,9 +2912,7 @@ static void tg3_tx(struct tg3 *tp)
 		struct sk_buff *skb = ri->skb;
 		int i;
 
-		if (unlikely(skb == NULL))
-			BUG();
-
+		BUG_ON(skb == NULL);
 		pci_unmap_single(tp->pdev,
 				 pci_unmap_addr(ri, mapping),
 				 skb_headlen(skb),
@@ -2926,12 +2923,10 @@ static void tg3_tx(struct tg3 *tp)
 		sw_idx = NEXT_TX(sw_idx);
 
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
-			if (unlikely(sw_idx == hw_idx))
-				BUG();
+			BUG_ON(sw_idx == hw_idx);
 
 			ri = &tp->tx_buffers[sw_idx];
-			if (unlikely(ri->skb != NULL))
-				BUG();
+			BUG_ON(ri->skb != NULL);
 
 			pci_unmap_page(tp->pdev,
 				       pci_unmap_addr(ri, mapping),
@@ -4715,9 +4710,8 @@ static int tg3_halt_cpu(struct tg3 *tp, 
 {
 	int i;
 
-	if (offset == TX_CPU_BASE &&
-	    (tp->tg3_flags2 & TG3_FLG2_5705_PLUS))
-		BUG();
+	BUG_ON(offset == TX_CPU_BASE &&
+	    (tp->tg3_flags2 & TG3_FLG2_5705_PLUS));
 
 	if (offset == RX_CPU_BASE) {
 		for (i = 0; i < 10000; i++) {
--- linux-2.6.16-rc2-git2/drivers/net/eql.c.orig	2006-02-07 21:43:10.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/eql.c	2006-02-07 21:43:24.000000000 +0100
@@ -203,8 +203,7 @@ static int eql_open(struct net_device *d
 	printk(KERN_INFO "%s: remember to turn off Van-Jacobson compression on "
 	       "your slave devices.\n", dev->name);
 
-	if (!list_empty(&eql->queue.all_slaves))
-		BUG();
+	BUG_ON(!list_empty(&eql->queue.all_slaves));
 
 	eql->min_slaves = 1;
 	eql->max_slaves = EQL_DEFAULT_MAX_SLAVES; /* 4 usually... */
--- linux-2.6.16-rc2-git2/drivers/net/yellowfin.c.orig	2006-02-07 21:43:33.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/yellowfin.c	2006-02-07 21:43:42.000000000 +0100
@@ -1441,8 +1441,7 @@ static void __devexit yellowfin_remove_o
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct yellowfin_private *np;
 
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 	np = netdev_priv(dev);
 
         pci_free_consistent(pdev, STATUS_TOTAL_SIZE, np->tx_status, 
--- linux-2.6.16-rc2-git2/drivers/net/ne2k-pci.c.orig	2006-02-07 21:43:55.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/ne2k-pci.c	2006-02-07 21:44:05.000000000 +0100
@@ -645,9 +645,7 @@ static void __devexit ne2k_pci_remove_on
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
 
-	if (!dev)
-		BUG();
-
+	BUG_ON(!dev);
 	unregister_netdev(dev);
 	release_region(dev->base_addr, NE_IO_EXTENT);
 	free_netdev(dev);
--- linux-2.6.16-rc2-git2/drivers/net/irda/sa1100_ir.c.orig	2006-02-07 21:45:11.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/irda/sa1100_ir.c	2006-02-07 21:45:21.000000000 +0100
@@ -695,8 +695,7 @@ static int sa1100_irda_hard_xmit(struct 
 		/*
 		 * We must not be transmitting...
 		 */
-		if (si->txskb)
-			BUG();
+		BUG_ON(si->txskb);
 
 		netif_stop_queue(dev);
 
--- linux-2.6.16-rc2-git2/drivers/net/chelsio/sge.c.orig	2006-02-07 21:45:33.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/chelsio/sge.c	2006-02-07 21:45:47.000000000 +0100
@@ -1093,8 +1093,7 @@ static int process_responses(struct adap
 		if (likely(e->DataValid)) {
 			struct freelQ *fl = &sge->freelQ[e->FreelistQid];
 
-			if (unlikely(!e->Sop || !e->Eop))
-				BUG();
+			BUG_ON(!e->Sop || !e->Eop);
 			if (unlikely(e->Offload))
 				unexpected_offload(adapter, fl);
 			else
--- linux-2.6.16-rc2-git2/drivers/net/b44.c.orig	2006-02-07 21:46:01.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/b44.c	2006-02-07 21:46:11.000000000 +0100
@@ -608,8 +608,7 @@ static void b44_tx(struct b44 *bp)
 		struct ring_info *rp = &bp->tx_buffers[cons];
 		struct sk_buff *skb = rp->skb;
 
-		if (unlikely(skb == NULL))
-			BUG();
+		BUG_ON(skb == NULL);
 
 		pci_unmap_single(bp->pdev,
 				 pci_unmap_addr(rp, mapping),
--- linux-2.6.16-rc2-git2/drivers/net/arcnet/arcnet.c.orig	2006-02-07 21:47:52.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/arcnet/arcnet.c	2006-02-07 21:48:23.000000000 +0100
@@ -761,8 +761,7 @@ irqreturn_t arcnet_interrupt(int irq, vo
 	BUGMSG(D_DURING, "in arcnet_interrupt\n");
 	
 	lp = dev->priv;
-	if (!lp)
-		BUG();
+	BUG_ON(!lp);
 		
 	spin_lock(&lp->lock);
 
--- linux-2.6.16-rc2-git2/drivers/net/tokenring/madgemc.c.orig	2006-02-07 21:46:41.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/tokenring/madgemc.c	2006-02-07 21:47:29.000000000 +0100
@@ -735,8 +735,7 @@ static int __devexit madgemc_remove(stru
 	struct net_local *tp;
         struct card_info *card;
 
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 
 	tp = dev->priv;
 	card = tp->tmspriv;
--- linux-2.6.16-rc2-git2/drivers/net/tokenring/abyss.c.orig	2006-02-07 21:47:36.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/tokenring/abyss.c	2006-02-07 21:47:43.000000000 +0100
@@ -438,8 +438,7 @@ static void __devexit abyss_detach (stru
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
 	
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 	unregister_netdev(dev);
 	release_region(dev->base_addr-0x10, ABYSS_IO_EXTENT);
 	free_irq(dev->irq, dev);
--- linux-2.6.16-rc2-git2/drivers/net/arcnet/arcnet.c.orig	2006-02-07 21:47:52.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/arcnet/arcnet.c	2006-02-07 21:48:23.000000000 +0100
@@ -761,8 +761,7 @@ irqreturn_t arcnet_interrupt(int irq, vo
 	BUGMSG(D_DURING, "in arcnet_interrupt\n");
 	
 	lp = dev->priv;
-	if (!lp)
-		BUG();
+	BUG_ON(!lp);
 		
 	spin_lock(&lp->lock);
 
--- linux-2.6.16-rc2-git2/drivers/net/ns83820.c.orig	2006-02-07 21:49:57.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/ns83820.c	2006-02-07 21:51:04.000000000 +0100
@@ -567,8 +567,7 @@ static inline int ns83820_add_rx_skb(str
 #endif
 
 	sg = dev->rx_info.descs + (next_empty * DESC_SIZE);
-	if (unlikely(NULL != dev->rx_info.skbs[next_empty]))
-		BUG();
+	BUG_ON(NULL != dev->rx_info.skbs[next_empty]);
 	dev->rx_info.skbs[next_empty] = skb;
 
 	dev->rx_info.next_empty = (next_empty + 1) % NR_RX_DESC;
--- linux-2.6.16-rc2-git2/drivers/net/wireless/ipw2200.c.orig	2006-02-07 21:51:20.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/wireless/ipw2200.c	2006-02-07 21:51:57.000000000 +0100
@@ -5603,8 +5603,7 @@ static void ipw_adhoc_create(struct ipw_
 	case IEEE80211_52GHZ_BAND:
 		network->mode = IEEE_A;
 		i = ipw_channel_to_index(priv->ieee, priv->channel);
-		if (i == -1)
-			BUG();
+		BUG_ON(i == -1);
 		if (geo->a[i].flags & IEEE80211_CH_PASSIVE_ONLY) {
 			IPW_WARNING("Overriding invalid channel\n");
 			priv->channel = geo->a[0].channel;
@@ -5617,8 +5616,7 @@ static void ipw_adhoc_create(struct ipw_
 		else
 			network->mode = IEEE_B;
 		i = ipw_channel_to_index(priv->ieee, priv->channel);
-		if (i == -1)
-			BUG();
+		BUG_ON(i == -1);
 		if (geo->bg[i].flags & IEEE80211_CH_PASSIVE_ONLY) {
 			IPW_WARNING("Overriding invalid channel\n");
 			priv->channel = geo->bg[0].channel;
@@ -6756,8 +6754,7 @@ static int ipw_qos_association(struct ip
 
 	switch (priv->ieee->iw_mode) {
 	case IW_MODE_ADHOC:
-		if (!(network->capability & WLAN_CAPABILITY_IBSS))
-			BUG();
+		BUG_ON(!(network->capability & WLAN_CAPABILITY_IBSS));
 
 		qos_data = &ibss_data;
 		break;
--- linux-2.6.16-rc2-git2/drivers/net/8139cp.c.orig	2006-02-07 21:52:12.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/8139cp.c	2006-02-07 21:52:49.000000000 +0100
@@ -539,8 +539,7 @@ rx_status_loop:
 		unsigned buflen;
 
 		skb = cp->rx_skb[rx_tail].skb;
-		if (!skb)
-			BUG();
+		BUG_ON(!skb);
 
 		desc = &cp->rx_ring[rx_tail];
 		status = le32_to_cpu(desc->opts1);
@@ -723,8 +722,7 @@ static void cp_tx (struct cp_private *cp
 			break;
 
 		skb = cp->tx_skb[tx_tail].skb;
-		if (!skb)
-			BUG();
+		BUG_ON(!skb);
 
 		pci_unmap_single(cp->pdev, cp->tx_skb[tx_tail].mapping,
 				 cp->tx_skb[tx_tail].len, PCI_DMA_TODEVICE);
@@ -1545,8 +1543,7 @@ static void cp_get_ethtool_stats (struct
 	tmp_stats[i++] = le16_to_cpu(nic_stats->tx_abort);
 	tmp_stats[i++] = le16_to_cpu(nic_stats->tx_underrun);
 	tmp_stats[i++] = cp->cp_stats.rx_frags;
-	if (i != CP_NUM_STATS)
-		BUG();
+	BUG_ON(i != CP_NUM_STATS);
 
 	pci_free_consistent(cp->pdev, sizeof(*nic_stats), nic_stats, dma);
 }
@@ -1851,8 +1848,7 @@ static void cp_remove_one (struct pci_de
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct cp_private *cp = netdev_priv(dev);
 
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 	unregister_netdev(dev);
 	iounmap(cp->regs);
 	if (cp->wol_enabled) pci_set_power_state (pdev, PCI_D0);
--- linux-2.6.16-rc2-git2/drivers/net/starfire.c.orig	2006-02-07 21:52:59.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/net/starfire.c	2006-02-07 21:53:34.000000000 +0100
@@ -2090,8 +2090,7 @@ static void __devexit starfire_remove_on
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct netdev_private *np = netdev_priv(dev);
 
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 
 	unregister_netdev(dev);
 



--===============46746193818869686==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46746193818869686==--
