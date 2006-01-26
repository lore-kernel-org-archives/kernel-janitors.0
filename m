From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 21:02:43 +0000
Subject: [KJ] [Patch 1/3] BUG_ON() Conversion in net/tulip/de2104x.c
Message-Id: <1138309363.26201.4.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51969108272691855=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51969108272691855==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

One of the if()s contains a call to de_is_running(),
which seems to be safe to replace, but someone with more
knownledge of the code might want to verify this...

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/net/tulip/de2104x.c.orig	2006-01-26 20:17:15.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/net/tulip/de2104x.c	2006-01-26 20:31:14.000000000 +0100
@@ -402,8 +402,7 @@ static void de_rx (struct de_private *de
 		unsigned copying_skb, buflen;
 
 		skb = de->rx_skb[rx_tail].skb;
-		if (!skb)
-			BUG();
+		BUG_ON(!skb);
 		rmb();
 		status = le32_to_cpu(de->rx_ring[rx_tail].opts1);
 		if (status & DescOwn)
@@ -545,8 +544,7 @@ static void de_tx (struct de_private *de
 			break;
 
 		skb = de->tx_skb[tx_tail].skb;
-		if (!skb)
-			BUG();
+		BUG_ON(!skb);
 		if (unlikely(skb == DE_DUMMY_SKB))
 			goto next;
 
@@ -789,8 +787,7 @@ static void __de_set_rx_mode (struct net
 
 	de->tx_head = NEXT_TX(entry);
 
-	if (TX_BUFFS_AVAIL(de) < 0)
-		BUG();
+	BUG_ON(TX_BUFFS_AVAIL(de) < 0);
 	if (TX_BUFFS_AVAIL(de) == 0)
 		netif_stop_queue(dev);
 
@@ -916,8 +913,7 @@ static void de_set_media (struct de_priv
 	unsigned media = de->media_type;
 	u32 macmode = dr32(MacMode);
 
-	if (de_is_running(de))
-		BUG();
+	BUG_ON(de_is_running(de));
 
 	if (de->de21040)
 		dw32(CSR11, FULL_DUPLEX_MAGIC);
@@ -1153,8 +1149,7 @@ static void de_media_interrupt (struct d
 		return;
 	}
 	
-	if (!(status & LinkFail))
-		BUG();
+	BUG_ON(!(status & LinkFail));
 
 	if (netif_carrier_ok(de->dev)) {
 		de_link_down(de);
@@ -2092,8 +2087,7 @@ static void __exit de_remove_one (struct
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct de_private *de = dev->priv;
 
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 	unregister_netdev(dev);
 	kfree(de->ee_data);
 	iounmap(de->regs);



--===============51969108272691855==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51969108272691855==--
