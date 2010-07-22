From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Jul 2010 11:11:31 +0000
Subject: [patch -next] caif: precedence bug
Message-Id: <20100722111131.GB17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SjurBraendeland@stericsson.com
Cc: "David S. Miller" <davem@davemloft.net>, Sjur Braendeland <sjur.brandeland@stericsson.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Negate has precedence over comparison so the original assert only
checked that "rfml->fragment_size" was larger than 1 or 0.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/caif/cfrfml.c b/net/caif/cfrfml.c
index 4b04d25..eb16020 100644
--- a/net/caif/cfrfml.c
+++ b/net/caif/cfrfml.c
@@ -193,7 +193,7 @@ out:
 
 static int cfrfml_transmit_segment(struct cfrfml *rfml, struct cfpkt *pkt)
 {
-	caif_assert(!cfpkt_getlen(pkt) < rfml->fragment_size);
+	caif_assert(cfpkt_getlen(pkt) >= rfml->fragment_size);
 
 	/* Add info for MUX-layer to route the packet out. */
 	cfpkt_info(pkt)->channel_id = rfml->serv.layer.id;
