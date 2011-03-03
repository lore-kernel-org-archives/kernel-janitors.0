From: Maksym Planeta <mcsim.planeta@gmail.com>
Date: Thu, 03 Mar 2011 16:26:57 +0000
Subject: [PATCH] Replaces dprintk with pr_debug
Message-Id: <1299169617-27965-1-git-send-email-mcsim.planeta@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replaces dprintk with pr_debug and corrects some of checkpatch.pl
 warnings

Signed-off-by: Maksym Planeta <mcsim.planeta@gmail.com>
---
 net/llc/llc_input.c |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/net/llc/llc_input.c b/net/llc/llc_input.c
index f996874..8915352 100644
--- a/net/llc/llc_input.c
+++ b/net/llc/llc_input.c
@@ -2,7 +2,7 @@
  * llc_input.c - Minimal input path for LLC
  *
  * Copyright (c) 1997 by Procom Technology, Inc.
- * 		 2001-2003 by Arnaldo Carvalho de Melo <acme@conectiva.com.br>
+ *		2001-2003 by Arnaldo Carvalho de Melo <acme@conectiva.com.br>
  *
  * This program can be redistributed or modified under the terms of the
  * GNU General Public License as published by the Free Software Foundation.
@@ -18,12 +18,6 @@
 #include <net/llc_pdu.h>
 #include <net/llc_sap.h>
 
-#if 0
-#define dprintk(args...) printk(KERN_DEBUG args)
-#else
-#define dprintk(args...)
-#endif
-
 /*
  * Packet handler for the station, registerable because in the minimal
  * LLC core that is taking shape only the very minimal subset of LLC that
@@ -62,7 +56,7 @@ void llc_set_station_handler(void (*handler)(struct sk_buff *skb))
  *
  *	This function returns which LLC component must handle this PDU.
  */
-static __inline__ int llc_pdu_type(struct sk_buff *skb)
+static inline int llc_pdu_type(struct sk_buff *skb)
 {
 	int type = LLC_DEST_CONN; /* I-PDU or S-PDU type */
 	struct llc_pdu_sn *pdu = llc_pdu_sn_hdr(skb);
@@ -159,7 +153,7 @@ int llc_rcv(struct sk_buff *skb, struct net_device *dev,
 	 * receives, do not try to analyse it.
 	 */
 	if (unlikely(skb->pkt_type = PACKET_OTHERHOST)) {
-		dprintk("%s: PACKET_OTHERHOST\n", __func__);
+		pr_debug("%s: PACKET_OTHERHOST\n", __func__);
 		goto drop;
 	}
 	skb = skb_share_check(skb, GFP_ATOMIC);
@@ -172,7 +166,7 @@ int llc_rcv(struct sk_buff *skb, struct net_device *dev,
 	       goto handle_station;
 	sap = llc_sap_find(pdu->dsap);
 	if (unlikely(!sap)) {/* unknown SAP */
-		dprintk("%s: llc_sap_find(%02X) failed!\n", __func__,
+		pr_debug("%s: llc_sap_find(%02X) failed!\n", __func__,
 			pdu->dsap);
 		goto drop;
 	}
-- 
1.7.2.3
