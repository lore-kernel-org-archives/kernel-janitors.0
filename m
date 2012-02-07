From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2012 07:20:15 +0000
Subject: [patch] caif: remove duplicate initialization
Message-Id: <20120207072015.GB21047@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"priv" is initialized twice.  I kept the second one, because it is next
to the check for NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/caif/chnl_net.c b/net/caif/chnl_net.c
index a751d9b..e866234 100644
--- a/net/caif/chnl_net.c
+++ b/net/caif/chnl_net.c
@@ -72,13 +72,12 @@ static void robust_list_del(struct list_head *delete_node)
 static int chnl_recv_cb(struct cflayer *layr, struct cfpkt *pkt)
 {
 	struct sk_buff *skb;
-	struct chnl_net *priv  = container_of(layr, struct chnl_net, chnl);
+	struct chnl_net *priv;
 	int pktlen;
 	const u8 *ip_version;
 	u8 buf;
 
 	priv = container_of(layr, struct chnl_net, chnl);
-
 	if (!priv)
 		return -EINVAL;
 
