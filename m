From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 10 Feb 2006 15:23:01 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/isdn
Message-Id: <1139584982.13555.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97386454798049793=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============97386454798049793==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc2-git2/drivers/isdn/hisax/hisax_isac.c.orig	2006-02-09 19:56:34.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/isdn/hisax/hisax_isac.c	2006-02-09 19:57:02.000000000 +0100
@@ -476,12 +476,10 @@ static void isac_fill_fifo(struct isac *
 	unsigned char cmd;
 	u_char *ptr;
 
-	if (!isac->tx_skb)
-		BUG();
+	BUG_ON(!isac->tx_skb);
 
 	count = isac->tx_skb->len;
-	if (count <= 0)
-		BUG();
+	BUG_ON(count <= 0);
 
 	DBG(DBG_IRQ, "count %d", count);
 
@@ -859,8 +857,7 @@ void isac_d_l2l1(struct hisax_if *hisax_
 			dev_kfree_skb(skb);
 			break;
 		}
-		if (isac->tx_skb)
-			BUG();
+		BUG_ON(isac->tx_skb);
 
 		isac->tx_skb = skb;
 		isac_fill_fifo(isac);
--- linux-2.6.16-rc2-git2/drivers/isdn/hisax/st5481_b.c.orig	2006-02-09 19:57:17.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/isdn/hisax/st5481_b.c	2006-02-09 19:57:30.000000000 +0100
@@ -356,9 +356,7 @@ void st5481_b_l2l1(struct hisax_if *ifc,
 
 	switch (pr) {
 	case PH_DATA | REQUEST:
-		if (bcs->b_out.tx_skb)
-			BUG();
-		
+		BUG_ON(bcs->b_out.tx_skb);
 		bcs->b_out.tx_skb = skb;
 		break;
 	case PH_ACTIVATE | REQUEST:
--- linux-2.6.16-rc2-git2/drivers/isdn/hisax/hisax_fcpcipnp.c.orig	2006-02-09 19:57:44.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/isdn/hisax/hisax_fcpcipnp.c	2006-02-09 19:58:00.000000000 +0100
@@ -387,8 +387,7 @@ static void hdlc_fill_fifo(struct fritz_
 
 	DBG(0x40, "hdlc_fill_fifo");
 
-	if (skb->len == 0)
-		BUG();
+	BUG_ON(skb->len == 0);
 
 	bcs->ctrl.sr.cmd &= ~HDLC_CMD_XME;
 	if (bcs->tx_skb->len > bcs->fifo_size) {
@@ -630,9 +629,7 @@ static void fritz_b_l2l1(struct hisax_if
 
 	switch (pr) {
 	case PH_DATA | REQUEST:
-		if (bcs->tx_skb)
-			BUG();
-		
+		BUG_ON(bcs->tx_skb);
 		bcs->tx_skb = skb;
 		DBG_SKB(1, skb);
 		hdlc_fill_fifo(bcs);
--- linux-2.6.16-rc2-git2/drivers/isdn/hisax/st5481_d.c.orig	2006-02-09 19:58:19.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/isdn/hisax/st5481_d.c	2006-02-09 19:58:31.000000000 +0100
@@ -596,9 +596,7 @@ void st5481_d_l2l1(struct hisax_if *hisa
 		break;
 	case PH_DATA | REQUEST:
 		DBG(2, "PH_DATA REQUEST len %d", skb->len);
-		if (adapter->d_out.tx_skb)
-			BUG();
-
+		BUG_ON(adapter->d_out.tx_skb);
 		adapter->d_out.tx_skb = skb;
 		FsmEvent(&adapter->d_out.fsm, EV_DOUT_START_XMIT, NULL);
 		break;
--- linux-2.6.16-rc2-git2/drivers/isdn/i4l/isdn_ppp.c.orig	2006-02-09 19:58:58.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/isdn/i4l/isdn_ppp.c	2006-02-09 19:59:31.000000000 +0100
@@ -973,8 +973,7 @@ void isdn_ppp_receive(isdn_net_dev * net
 	int slot;
 	int proto;
 
-	if (net_dev->local->master)
-		BUG(); // we're called with the master device always
+	BUG_ON(net_dev->local->master); // we're called with the master device always
 
 	slot = lp->ppp_slot;
 	if (slot < 0 || slot >= ISDN_MAX_CHANNELS) {
@@ -2526,8 +2525,7 @@ static struct sk_buff *isdn_ppp_decompre
 		printk(KERN_DEBUG "ippp: no decompressor defined!\n");
 		return skb;
 	}
-	if (!stat) // if we have a compressor, stat has been set as well
-		BUG();
+	BUG_ON(!stat); // if we have a compressor, stat has been set as well
 
 	if((master && *proto == PPP_COMP) || (!master && *proto == PPP_COMPFRAG) ) {
 		// compressed packets are compressed by their protocol type



--===============97386454798049793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97386454798049793==--
