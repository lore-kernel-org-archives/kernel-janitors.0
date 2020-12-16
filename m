From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2020 08:32:12 +0000
Subject: [PATCH 2/2] ath11k: Fix ath11k_pci_fix_l1ss()
Message-Id: <X9nGDHiTh+Z+asDy@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <X9nF17L2/EKOSbn/@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

All these conditions are reversed so presumably most of the function is
dead code.

Fixes: 0699940755e9 ("ath11k: pci: fix L1ss clock unstable problem")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 857647aa57c8..9f9a824a4c2d 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -274,7 +274,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG,
 				      PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL,
 				      PCIE_QSERDES_COM_SYSCLK_EN_SEL_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set sysclk: %d\n", ret);
 		return ret;
 	}
@@ -283,7 +283,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG1_REG,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG1_VAL,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set dtct config1 error: %d\n", ret);
 		return ret;
 	}
@@ -292,7 +292,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG2_REG,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG2_VAL,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set dtct config2: %d\n", ret);
 		return ret;
 	}
@@ -301,7 +301,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG4_REG,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG4_VAL,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set dtct config4: %d\n", ret);
 		return ret;
 	}
-- 
2.29.2
