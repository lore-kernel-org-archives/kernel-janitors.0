From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 18:45:09 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_mISDN=3a_Delete_unnecessary_checks_before_the?= =?UTF-8?B?IG1hY3JvIGNhbGwg4oCc
Message-Id: <689e51d5-9a43-45a4-5d33-75a34eba928a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>, Allison Randal <allison@lohutok.net>, Armijn Hemel <armijn@tjaldur.nl>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Fuqian Huang <huangfq.daxian@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiner Kallweit <hkallweit1@gmail.com>, Kangjie Lu <kjlu@umn.edu>, Karsten Keil <isdn@linux-pingi.de>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 20:10:56 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the shown calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/isdn/hardware/mISDN/avmfritz.c  |  3 +--
 drivers/isdn/hardware/mISDN/hfcpci.c    |  6 ++----
 drivers/isdn/hardware/mISDN/mISDNipac.c | 12 ++++--------
 drivers/isdn/hardware/mISDN/mISDNisar.c |  3 +--
 drivers/isdn/hardware/mISDN/netjet.c    |  3 +--
 drivers/isdn/hardware/mISDN/w6692.c     |  9 +++------
 drivers/isdn/mISDN/l1oip_core.c         |  3 +--
 drivers/isdn/mISDN/layer2.c             |  9 +++------
 drivers/isdn/mISDN/stack.c              |  6 ++----
 drivers/isdn/mISDN/tei.c                |  6 ++----
 10 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/avmfritz.c b/drivers/isdn/hardware/mISDN/avmfritz.c
index 81f2b183acc8..1137dd152b5c 100644
--- a/drivers/isdn/hardware/mISDN/avmfritz.c
+++ b/drivers/isdn/hardware/mISDN/avmfritz.c
@@ -509,8 +509,7 @@ HDLC_irq_xpr(struct bchannel *bch)
 	if (bch->tx_skb && bch->tx_idx < bch->tx_skb->len) {
 		hdlc_fill_fifo(bch);
 	} else {
-		if (bch->tx_skb)
-			dev_kfree_skb(bch->tx_skb);
+		dev_kfree_skb(bch->tx_skb);
 		if (get_next_bframe(bch)) {
 			hdlc_fill_fifo(bch);
 			test_and_clear_bit(FLG_TX_EMPTY, &bch->Flags);
diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
index 4a069582fc6b..2330a7d24267 100644
--- a/drivers/isdn/hardware/mISDN/hfcpci.c
+++ b/drivers/isdn/hardware/mISDN/hfcpci.c
@@ -1119,8 +1119,7 @@ tx_birq(struct bchannel *bch)
 	if (bch->tx_skb && bch->tx_idx < bch->tx_skb->len)
 		hfcpci_fill_fifo(bch);
 	else {
-		if (bch->tx_skb)
-			dev_kfree_skb(bch->tx_skb);
+		dev_kfree_skb(bch->tx_skb);
 		if (get_next_bframe(bch))
 			hfcpci_fill_fifo(bch);
 	}
@@ -1132,8 +1131,7 @@ tx_dirq(struct dchannel *dch)
 	if (dch->tx_skb && dch->tx_idx < dch->tx_skb->len)
 		hfcpci_fill_dfifo(dch->hw);
 	else {
-		if (dch->tx_skb)
-			dev_kfree_skb(dch->tx_skb);
+		dev_kfree_skb(dch->tx_skb);
 		if (get_next_dframe(dch))
 			hfcpci_fill_dfifo(dch->hw);
 	}
diff --git a/drivers/isdn/hardware/mISDN/mISDNipac.c b/drivers/isdn/hardware/mISDN/mISDNipac.c
index f915399d75ca..bca880213e91 100644
--- a/drivers/isdn/hardware/mISDN/mISDNipac.c
+++ b/drivers/isdn/hardware/mISDN/mISDNipac.c
@@ -190,8 +190,7 @@ isac_rme_irq(struct isac_hw *isac)
 #endif
 		}
 		WriteISAC(isac, ISAC_CMDR, 0x80);
-		if (isac->dch.rx_skb)
-			dev_kfree_skb(isac->dch.rx_skb);
+		dev_kfree_skb(isac->dch.rx_skb);
 		isac->dch.rx_skb = NULL;
 	} else {
 		count = ReadISAC(isac, ISAC_RBCL) & 0x1f;
@@ -210,8 +209,7 @@ isac_xpr_irq(struct isac_hw *isac)
 	if (isac->dch.tx_skb && isac->dch.tx_idx < isac->dch.tx_skb->len) {
 		isac_fill_fifo(isac);
 	} else {
-		if (isac->dch.tx_skb)
-			dev_kfree_skb(isac->dch.tx_skb);
+		dev_kfree_skb(isac->dch.tx_skb);
 		if (get_next_dframe(&isac->dch))
 			isac_fill_fifo(isac);
 	}
@@ -464,8 +462,7 @@ isacsx_rme_irq(struct isac_hw *isac)
 			isac->dch.err_crc++;
 #endif
 		WriteISAC(isac, ISACX_CMDRD, ISACX_CMDRD_RMC);
-		if (isac->dch.rx_skb)
-			dev_kfree_skb(isac->dch.rx_skb);
+		dev_kfree_skb(isac->dch.rx_skb);
 		isac->dch.rx_skb = NULL;
 	} else {
 		count = ReadISAC(isac, ISACX_RBCLD) & 0x1f;
@@ -1012,8 +1009,7 @@ hscx_xpr(struct hscx_hw *hx)
 	if (hx->bch.tx_skb && hx->bch.tx_idx < hx->bch.tx_skb->len) {
 		hscx_fill_fifo(hx);
 	} else {
-		if (hx->bch.tx_skb)
-			dev_kfree_skb(hx->bch.tx_skb);
+		dev_kfree_skb(hx->bch.tx_skb);
 		if (get_next_bframe(&hx->bch)) {
 			hscx_fill_fifo(hx);
 			test_and_clear_bit(FLG_TX_EMPTY, &hx->bch.Flags);
diff --git a/drivers/isdn/hardware/mISDN/mISDNisar.c b/drivers/isdn/hardware/mISDN/mISDNisar.c
index fd5c52f37802..4a3e748a1c26 100644
--- a/drivers/isdn/hardware/mISDN/mISDNisar.c
+++ b/drivers/isdn/hardware/mISDN/mISDNisar.c
@@ -690,8 +690,7 @@ send_next(struct isar_ch *ch)
 			}
 		}
 	}
-	if (ch->bch.tx_skb)
-		dev_kfree_skb(ch->bch.tx_skb);
+	dev_kfree_skb(ch->bch.tx_skb);
 	if (get_next_bframe(&ch->bch)) {
 		isar_fill_fifo(ch);
 		test_and_clear_bit(FLG_TX_EMPTY, &ch->bch.Flags);
diff --git a/drivers/isdn/hardware/mISDN/netjet.c b/drivers/isdn/hardware/mISDN/netjet.c
index 4e30affd1a7c..61caa7e50b9a 100644
--- a/drivers/isdn/hardware/mISDN/netjet.c
+++ b/drivers/isdn/hardware/mISDN/netjet.c
@@ -605,8 +605,7 @@ bc_next_frame(struct tiger_ch *bc)
 	if (bc->bch.tx_skb && bc->bch.tx_idx < bc->bch.tx_skb->len) {
 		fill_dma(bc);
 	} else {
-		if (bc->bch.tx_skb)
-			dev_kfree_skb(bc->bch.tx_skb);
+		dev_kfree_skb(bc->bch.tx_skb);
 		if (get_next_bframe(&bc->bch)) {
 			fill_dma(bc);
 			test_and_clear_bit(FLG_TX_EMPTY, &bc->bch.Flags);
diff --git a/drivers/isdn/hardware/mISDN/w6692.c b/drivers/isdn/hardware/mISDN/w6692.c
index 2402608dc98d..bad55fdacd36 100644
--- a/drivers/isdn/hardware/mISDN/w6692.c
+++ b/drivers/isdn/hardware/mISDN/w6692.c
@@ -356,8 +356,7 @@ handle_rxD(struct w6692_hw *card) {
 			card->dch.err_rx++;
 #endif
 		}
-		if (card->dch.rx_skb)
-			dev_kfree_skb(card->dch.rx_skb);
+		dev_kfree_skb(card->dch.rx_skb);
 		card->dch.rx_skb = NULL;
 		WriteW6692(card, W_D_CMDR, W_D_CMDR_RACK | W_D_CMDR_RRST);
 	} else {
@@ -376,8 +375,7 @@ handle_txD(struct w6692_hw *card) {
 	if (card->dch.tx_skb && card->dch.tx_idx < card->dch.tx_skb->len) {
 		W6692_fill_Dfifo(card);
 	} else {
-		if (card->dch.tx_skb)
-			dev_kfree_skb(card->dch.tx_skb);
+		dev_kfree_skb(card->dch.tx_skb);
 		if (get_next_dframe(&card->dch))
 			W6692_fill_Dfifo(card);
 	}
@@ -636,8 +634,7 @@ send_next(struct w6692_ch *wch)
 	if (wch->bch.tx_skb && wch->bch.tx_idx < wch->bch.tx_skb->len) {
 		W6692_fill_Bfifo(wch);
 	} else {
-		if (wch->bch.tx_skb)
-			dev_kfree_skb(wch->bch.tx_skb);
+		dev_kfree_skb(wch->bch.tx_skb);
 		if (get_next_bframe(&wch->bch)) {
 			W6692_fill_Bfifo(wch);
 			test_and_clear_bit(FLG_TX_EMPTY, &wch->bch.Flags);
diff --git a/drivers/isdn/mISDN/l1oip_core.c b/drivers/isdn/mISDN/l1oip_core.c
index 447f241467bd..b57dcb834594 100644
--- a/drivers/isdn/mISDN/l1oip_core.c
+++ b/drivers/isdn/mISDN/l1oip_core.c
@@ -1254,8 +1254,7 @@ release_card(struct l1oip *hc)
 			mISDN_freebchannel(hc->chan[ch].bch);
 			kfree(hc->chan[ch].bch);
 #ifdef REORDER_DEBUG
-			if (hc->chan[ch].disorder_skb)
-				dev_kfree_skb(hc->chan[ch].disorder_skb);
+			dev_kfree_skb(hc->chan[ch].disorder_skb);
 #endif
 		}
 	}
diff --git a/drivers/isdn/mISDN/layer2.c b/drivers/isdn/mISDN/layer2.c
index 68a481516729..5bf7fcb282c4 100644
--- a/drivers/isdn/mISDN/layer2.c
+++ b/drivers/isdn/mISDN/layer2.c
@@ -900,8 +900,7 @@ l2_disconnect(struct FsmInst *fi, int event, void *arg)
 	send_uframe(l2, NULL, DISC | 0x10, CMD);
 	mISDN_FsmDelTimer(&l2->t203, 1);
 	restart_t200(l2, 2);
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 }

 static void
@@ -1722,8 +1721,7 @@ l2_set_own_busy(struct FsmInst *fi, int event, void *arg)
 		enquiry_cr(l2, RNR, RSP, 0);
 		test_and_clear_bit(FLG_ACK_PEND, &l2->flag);
 	}
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 }

 static void
@@ -1736,8 +1734,7 @@ l2_clear_own_busy(struct FsmInst *fi, int event, void *arg)
 		enquiry_cr(l2, RR, RSP, 0);
 		test_and_clear_bit(FLG_ACK_PEND, &l2->flag);
 	}
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 }

 static void
diff --git a/drivers/isdn/mISDN/stack.c b/drivers/isdn/mISDN/stack.c
index fa2237e7bcf8..27aa32914425 100644
--- a/drivers/isdn/mISDN/stack.c
+++ b/drivers/isdn/mISDN/stack.c
@@ -75,8 +75,7 @@ send_socklist(struct mISDN_sock_list *sl, struct sk_buff *skb)
 			cskb = NULL;
 	}
 	read_unlock(&sl->lock);
-	if (cskb)
-		dev_kfree_skb(cskb);
+	dev_kfree_skb(cskb);
 }

 static void
@@ -134,8 +133,7 @@ send_layer2(struct mISDNstack *st, struct sk_buff *skb)
 	}
 out:
 	mutex_unlock(&st->lmutex);
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 }

 static inline int
diff --git a/drivers/isdn/mISDN/tei.c b/drivers/isdn/mISDN/tei.c
index a4fa594e1caf..59d28cb19738 100644
--- a/drivers/isdn/mISDN/tei.c
+++ b/drivers/isdn/mISDN/tei.c
@@ -1328,10 +1328,8 @@ mgr_bcast(struct mISDNchannel *ch, struct sk_buff *skb)
 	}
 out:
 	read_unlock_irqrestore(&mgr->lock, flags);
-	if (cskb)
-		dev_kfree_skb(cskb);
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(cskb);
+	dev_kfree_skb(skb);
 	return 0;
 }

--
2.23.0
