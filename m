From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Jan 2013 13:42:14 +0000
Subject: [patch] bnx2x: NULL dereference on error in debug code
Message-Id: <20130108134213.GA23742@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"vfop" is NULL here.  I've changed the debugging to not use it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
index 71fcef0..3eef972 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
@@ -463,8 +463,7 @@ static int bnx2x_vfop_qdtor_cmd(struct bnx2x *bp,
 		return bnx2x_vfop_transition(bp, vf, bnx2x_vfop_qdtor,
 					     cmd->block);
 	}
-	DP(BNX2X_MSG_IOV, "VF[%d] failed to add a vfop. rc %d\n",
-	   vf->abs_vfid, vfop->rc);
+	DP(BNX2X_MSG_IOV, "VF[%d] failed to add a vfop.\n", vf->abs_vfid);
 	return -ENOMEM;
 }
 
