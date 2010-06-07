From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 14:51:58 +0000
Subject: [patch] caif: fix a couple range checks
Message-Id: <20100607145158.GO5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The extra ! character means that these conditions are always false.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/caif/cfveil.c b/net/caif/cfveil.c
index 0fd827f..e04f7d9 100644
--- a/net/caif/cfveil.c
+++ b/net/caif/cfveil.c
@@ -84,7 +84,7 @@ static int cfvei_transmit(struct cflayer *layr, struct cfpkt *pkt)
 		return ret;
 	caif_assert(layr->dn != NULL);
 	caif_assert(layr->dn->transmit != NULL);
-	if (!cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
+	if (cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
 		pr_warning("CAIF: %s(): Packet too large - size=%d\n",
 			   __func__, cfpkt_getlen(pkt));
 		return -EOVERFLOW;
diff --git a/net/caif/cfrfml.c b/net/caif/cfrfml.c
index cd2830f..fd27b17 100644
--- a/net/caif/cfrfml.c
+++ b/net/caif/cfrfml.c
@@ -83,7 +83,7 @@ static int cfrfml_transmit(struct cflayer *layr, struct cfpkt *pkt)
 	if (!cfsrvl_ready(service, &ret))
 		return ret;
 
-	if (!cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
+	if (cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
 		pr_err("CAIF: %s():Packet too large - size=%d\n",
 			__func__, cfpkt_getlen(pkt));
 		return -EOVERFLOW;
