From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Jan 2012 07:59:31 +0000
Subject: [patch -next] bnx2x: unlock before returning an error
Message-Id: <20120125075931.GA20199@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>, Yuval Mintz <yuvalmin@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We introduced a new return here but forgot to drop the lock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
index cb6339c..69465c3 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
@@ -1836,6 +1836,7 @@ static int bnx2x_vlan_mac_del_all(struct bnx2x *bp,
 			rc = exeq->remove(bp, exeq->owner, exeq_pos);
 			if (rc) {
 				BNX2X_ERR("Failed to remove command\n");
+				spin_unlock_bh(&exeq->lock);
 				return rc;
 			}
 			list_del(&exeq_pos->link);
