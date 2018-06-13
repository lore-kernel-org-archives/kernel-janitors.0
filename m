From: Colin King <colin.king@canonical.com>
Date: Wed, 13 Jun 2018 06:04:09 +0000
Subject: [PATCH 1/2] WAN: LMC: fix up indentations with tabs
Message-Id: <20180613060410.735-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently this source is using a mix of 4 char spaces and tabs
for indentations.  Clean this up to consistently use tabs. Also
add some white spaces in switch statements.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wan/lmc/lmc_proto.c | 79 ++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wan/lmc/lmc_proto.c b/drivers/net/wan/lmc/lmc_proto.c
index f600075e84a2..5a6c87bce1bf 100644
--- a/drivers/net/wan/lmc/lmc_proto.c
+++ b/drivers/net/wan/lmc/lmc_proto.c
@@ -49,17 +49,17 @@
 // attach
 void lmc_proto_attach(lmc_softc_t *sc) /*FOLD00*/
 {
-    lmc_trace(sc->lmc_device, "lmc_proto_attach in");
-    if (sc->if_type = LMC_NET) {
-            struct net_device *dev = sc->lmc_device;
-            /*
-	     * They set a few basics because they don't use HDLC
-             */
-            dev->flags |= IFF_POINTOPOINT;
-            dev->hard_header_len = 0;
-            dev->addr_len = 0;
-        }
-    lmc_trace(sc->lmc_device, "lmc_proto_attach out");
+	lmc_trace(sc->lmc_device, "lmc_proto_attach in");
+	if (sc->if_type = LMC_NET) {
+		struct net_device *dev = sc->lmc_device;
+		/*
+		 * They set a few basics because they don't use HDLC
+		 */
+		dev->flags |= IFF_POINTOPOINT;
+		dev->hard_header_len = 0;
+		dev->addr_len = 0;
+	}
+	lmc_trace(sc->lmc_device, "lmc_proto_attach out");
 }
 
 int lmc_proto_ioctl(lmc_softc_t *sc, struct ifreq *ifr, int cmd)
@@ -99,37 +99,36 @@ void lmc_proto_close(lmc_softc_t *sc)
 
 __be16 lmc_proto_type(lmc_softc_t *sc, struct sk_buff *skb) /*FOLD00*/
 {
-    lmc_trace(sc->lmc_device, "lmc_proto_type in");
-    switch(sc->if_type){
-    case LMC_PPP:
-	    return hdlc_type_trans(skb, sc->lmc_device);
-	    break;
-    case LMC_NET:
-        return htons(ETH_P_802_2);
-        break;
-    case LMC_RAW: /* Packet type for skbuff kind of useless */
-        return htons(ETH_P_802_2);
-        break;
-    default:
-        printk(KERN_WARNING "%s: No protocol set for this interface, assuming 802.2 (which is wrong!!)\n", sc->name);
-        return htons(ETH_P_802_2);
-        break;
-    }
-    lmc_trace(sc->lmc_device, "lmc_proto_tye out");
-
+	lmc_trace(sc->lmc_device, "lmc_proto_type in");
+	switch (sc->if_type) {
+	case LMC_PPP:
+		return hdlc_type_trans(skb, sc->lmc_device);
+		break;
+	case LMC_NET:
+		return htons(ETH_P_802_2);
+		break;
+	case LMC_RAW: /* Packet type for skbuff kind of useless */
+		return htons(ETH_P_802_2);
+		break;
+	default:
+		printk(KERN_WARNING "%s: No protocol set for this interface, assuming 802.2 (which is wrong!!)\n", sc->name);
+		return htons(ETH_P_802_2);
+		break;
+	}
+	lmc_trace(sc->lmc_device, "lmc_proto_tye out");
 }
 
 void lmc_proto_netif(lmc_softc_t *sc, struct sk_buff *skb) /*FOLD00*/
 {
-    lmc_trace(sc->lmc_device, "lmc_proto_netif in");
-    switch(sc->if_type){
-    case LMC_PPP:
-    case LMC_NET:
-    default:
-        netif_rx(skb);
-        break;
-    case LMC_RAW:
-        break;
-    }
-    lmc_trace(sc->lmc_device, "lmc_proto_netif out");
+	lmc_trace(sc->lmc_device, "lmc_proto_netif in");
+	switch (sc->if_type) {
+	case LMC_PPP:
+	case LMC_NET:
+	default:
+		netif_rx(skb);
+		break;
+	case LMC_RAW:
+		break;
+	}
+	lmc_trace(sc->lmc_device, "lmc_proto_netif out");
 }
-- 
2.17.0

