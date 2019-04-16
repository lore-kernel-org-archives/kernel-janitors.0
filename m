From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 11:43:17 +0000
Subject: [PATCH] qed: fix spelling mistake "faspath" -> "fastpath"
Message-Id: <20190416114317.28983-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DP_INFO message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_sriov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_sriov.c b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
index 9faaa6df78ed..2f318aaf2b05 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_sriov.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
@@ -1591,7 +1591,7 @@ static void qed_iov_vf_mbx_acquire(struct qed_hwfn *p_hwfn,
 			p_vfdev->eth_fp_hsi_minor = ETH_HSI_VER_NO_PKT_LEN_TUNN;
 		} else {
 			DP_INFO(p_hwfn,
-				"VF[%d] needs fastpath HSI %02x.%02x, which is incompatible with loaded FW's faspath HSI %02x.%02x\n",
+				"VF[%d] needs fastpath HSI %02x.%02x, which is incompatible with loaded FW's fastpath HSI %02x.%02x\n",
 				vf->abs_vf_id,
 				req->vfdev_info.eth_fp_hsi_major,
 				req->vfdev_info.eth_fp_hsi_minor,
-- 
2.20.1
