From: Dan Carpenter <error27@gmail.com>
Date: Fri, 24 Dec 2010 06:15:39 +0000
Subject: [patch] vxge: remove duplicated part of check
Message-Id: <20101224061539.GP1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramkrishna Vepa <ramkrishna.vepa@exar.com>
Cc: Sivakumar Subramani <sivakumar.subramani@exar.com>, Sreenivasa Honnur <sreenivasa.honnur@exar.com>, Jon Mason <jon.mason@exar.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is just a cleanup to make the static checkers happy.  We don't need
to check "own" twice.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/vxge/vxge-traffic.c b/drivers/net/vxge/vxge-traffic.c
index 42cc298..4c10d6c 100644
--- a/drivers/net/vxge/vxge-traffic.c
+++ b/drivers/net/vxge/vxge-traffic.c
@@ -1240,7 +1240,7 @@ enum vxge_hw_status vxge_hw_ring_rxd_next_completed(
 	*t_code	= (u8)VXGE_HW_RING_RXD_T_CODE_GET(control_0);
 
 	/* check whether it is not the end */
-	if (!own || ((*t_code = VXGE_HW_RING_T_CODE_FRM_DROP) && own)) {
+	if (!own || *t_code = VXGE_HW_RING_T_CODE_FRM_DROP) {
 
 		vxge_assert(((struct vxge_hw_ring_rxd_1 *)rxdp)->host_control ! 				0);
