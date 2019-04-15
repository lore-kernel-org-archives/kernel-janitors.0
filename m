From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Apr 2019 15:47:03 +0000
Subject: [PATCH] bnx2x: fix spelling mistake "dicline" -> "decline"
Message-Id: <20190415154703.25324-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a BNX2X_ERR message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
index 672b57f0b84d..0752b7fa4d9c 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
@@ -955,7 +955,7 @@ int bnx2x_vfpf_update_vlan(struct bnx2x *bp, u16 vid, u8 vf_qid, bool add)
 	bnx2x_sample_bulletin(bp);
 
 	if (bp->shadow_bulletin.content.valid_bitmap & 1 << VLAN_VALID) {
-		BNX2X_ERR("Hypervisor will dicline the request, avoiding\n");
+		BNX2X_ERR("Hypervisor will decline the request, avoiding\n");
 		rc = -EINVAL;
 		goto out;
 	}
-- 
2.20.1
