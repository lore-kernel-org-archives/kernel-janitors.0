From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Nov 2011 06:09:09 +0000
Subject: [patch] batman-adv: remove extra negation in gw_out_of_range()
Message-Id: <20111129060909.GA6098@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Lindner <lindner_marek@yahoo.de>
Cc: Simon Wunderlich <siwu@hrz.tu-chemnitz.de>, "David S. Miller" <davem@davemloft.net>, b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here where an extra '!' made the check to the opposite
of what was intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/batman-adv/gateway_client.c b/net/batman-adv/gateway_client.c
index 9373a14..24403a7 100644
--- a/net/batman-adv/gateway_client.c
+++ b/net/batman-adv/gateway_client.c
@@ -695,7 +695,7 @@ bool gw_out_of_range(struct bat_priv *bat_priv,
 	}
 
 	neigh_old = find_router(bat_priv, orig_dst_node, NULL);
-	if (!!neigh_old)
+	if (!neigh_old)
 		goto out;
 
 	if (curr_tq_avg - neigh_old->tq_avg > GW_THRESHOLD)
