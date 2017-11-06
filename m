From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Nov 2017 11:43:01 +0000
Subject: [PATCH net-next] bnxt: delete some unreachable code
Message-Id: <20171106114301.fjhcskixaji7hh7i@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, Jiri Pirko <jiri@mellanox.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We return on the previous line so this "return 0;" statement should just
be deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
index b6aa7db99705..69186d188c43 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
@@ -148,7 +148,6 @@ static int bnxt_vf_rep_setup_tc_block(struct net_device *dev,
 		return tcf_block_cb_register(f->block,
 					     bnxt_vf_rep_setup_tc_block_cb,
 					     vf_rep, vf_rep);
-		return 0;
 	case TC_BLOCK_UNBIND:
 		tcf_block_cb_unregister(f->block,
 					bnxt_vf_rep_setup_tc_block_cb, vf_rep);
