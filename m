From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 11:44:21 +0000
Subject: [PATCH net] rocker: move dereference before free
Message-Id: <20170628114421.qyv6lmugpbjqntpt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@resnulli.us>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that ofdpa_neigh_del() can sometimes free
"found".   It just makes sense to use it first before deleting it.

Fixes: ecf244f753e0 ("rocker: fix maybe-uninitialized warning")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Most ref counting function use atomic_dec() but ofdpa_neigh_del() just
uses normal decrement.  Are you sure this isn't racy?

This applies to net.  In net-next the code has shifted around and it
doesn't apply anymore.  Should I send a different patch for net-next?

diff --git a/drivers/net/ethernet/rocker/rocker_ofdpa.c b/drivers/net/ethernet/rocker/rocker_ofdpa.c
index 2ae852454780..a9ce82d3e9cf 100644
--- a/drivers/net/ethernet/rocker/rocker_ofdpa.c
+++ b/drivers/net/ethernet/rocker/rocker_ofdpa.c
@@ -1505,8 +1505,8 @@ static int ofdpa_port_ipv4_nh(struct ofdpa_port *ofdpa_port,
 		*index = entry->index;
 		resolved = false;
 	} else if (removing) {
-		ofdpa_neigh_del(trans, found);
 		*index = found->index;
+		ofdpa_neigh_del(trans, found);
 	} else if (updating) {
 		ofdpa_neigh_update(found, trans, NULL, false);
 		resolved = !is_zero_ether_addr(found->eth_dst);
