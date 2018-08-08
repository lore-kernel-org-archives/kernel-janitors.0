From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Aug 2018 18:04:27 +0000
Subject: [PATCH] ethernet/qlogic: remove unused array msi_tgt_status
Message-Id: <20180808180427.14864-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harish Patil <harish.patil@cavium.com>, Manish Chopra <manish.chopra@cavium.com>, Dept-GELinuxNICDev@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array msi_tgt_status is defined but never used, hence it is
redundant and can be removed.

Cleans up clang warning:
warning: 'msi_tgt_status' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c
index 7848cf04b29a..822aa393c370 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c
@@ -276,13 +276,6 @@ static const unsigned crb_hub_agt[64] = {
 	0,
 };
 
-static const u32 msi_tgt_status[8] = {
-	ISR_INT_TARGET_STATUS, ISR_INT_TARGET_STATUS_F1,
-	ISR_INT_TARGET_STATUS_F2, ISR_INT_TARGET_STATUS_F3,
-	ISR_INT_TARGET_STATUS_F4, ISR_INT_TARGET_STATUS_F5,
-	ISR_INT_TARGET_STATUS_F6, ISR_INT_TARGET_STATUS_F7
-};
-
 /*  PCI Windowing for DDR regions.  */
 
 #define QLCNIC_PCIE_SEM_TIMEOUT	10000
-- 
2.17.1

