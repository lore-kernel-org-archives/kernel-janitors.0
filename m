From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Thu, 05 Mar 2015 13:12:15 +0000
Subject: [PATCH 1/1] staging: rtl8192e: Remove unnecessary OOM message
Message-Id: <20150305131215.GA5607@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch reduces the kernel size by removing error messages that duplicate
the normal OOM message.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr)

@@
identifier f,print,l;
expression e;
constant char[] c;
@@

e = \(kzalloc\|kmalloc\|devm_kzalloc\|devm_kmalloc\)(...);
if (e = NULL) {
  <+...
-  print(...,c,...);
  ... when any
(
  goto l;
|
  return ...;
)
  ...+> }

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_module.c | 10 +++-------
 drivers/staging/rtl8192e/rtllib_rx.c     | 11 ++++-------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index 248cc0d..32cc8df 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -72,11 +72,8 @@ static inline int rtllib_networks_allocate(struct rtllib_device *ieee)
 	ieee->networks = kzalloc(
 		MAX_NETWORK_COUNT * sizeof(struct rtllib_network),
 		GFP_KERNEL);
-	if (!ieee->networks) {
-		printk(KERN_WARNING "%s: Out of memory allocating beacons\n",
-		       ieee->dev->name);
+	if (!ieee->networks)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
@@ -161,10 +158,9 @@ struct net_device *alloc_rtllib(int sizeof_priv)
 	rtllib_softmac_init(ieee);
 
 	ieee->pHTInfo = kzalloc(sizeof(struct rt_hi_throughput), GFP_KERNEL);
-	if (ieee->pHTInfo = NULL) {
-		RTLLIB_DEBUG(RTLLIB_DL_ERR, "can't alloc memory for HTInfo\n");
+	if (ieee->pHTInfo = NULL)
 		return NULL;
-	}
+
 	HTUpdateDefaultSetting(ieee);
 	HTInitializeHTInfo(ieee);
 	TSInitialize(ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 1664040..0a9cf44 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -394,10 +394,9 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 		}
 		if (p = &ieee->ibss_mac_hash[index]) {
 			entry = kmalloc(sizeof(struct ieee_ibss_seq), GFP_ATOMIC);
-			if (!entry) {
-				printk(KERN_WARNING "Cannot malloc new mac entry\n");
+			if (!entry)
 				return 0;
-			}
+
 			memcpy(entry->mac, mac, ETH_ALEN);
 			entry->seq_num[tid] = seq;
 			entry->frag_num[tid] = frag;
@@ -1345,11 +1344,9 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* skb: hdr + (possible reassembled) full plaintext payload */
 	payload = skb->data + hdrlen;
 	rxb = kmalloc(sizeof(struct rtllib_rxb), GFP_ATOMIC);
-	if (rxb = NULL) {
-		RTLLIB_DEBUG(RTLLIB_DL_ERR,
-			     "%s(): kmalloc rxb error\n", __func__);
+	if (rxb = NULL)
 		goto rx_dropped;
-	}
+
 	/* to parse amsdu packets */
 	/* qos data packets & reserved bit is 1 */
 	if (parse_subframe(ieee, skb, rx_stats, rxb, src, dst) = 0) {
-- 
1.9.1

