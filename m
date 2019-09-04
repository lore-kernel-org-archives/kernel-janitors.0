From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Sep 2019 11:40:14 +0000
Subject: [PATCH -next] phy: lantiq: vrx200-pcie: fix error return code in ltq_vrx200_pcie_phy_power_on()
Message-Id: <20190904114014.124099-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: e52a632195bf ("phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
index 544d64a84cc0..6e457967653e 100644
--- a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
+++ b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
@@ -323,7 +323,8 @@ static int ltq_vrx200_pcie_phy_power_on(struct phy *phy)
 		goto err_disable_pdi_clk;
 
 	/* Check if we are in "startup ready" status */
-	if (ltq_vrx200_pcie_phy_wait_for_pll(phy) != 0)
+	ret = ltq_vrx200_pcie_phy_wait_for_pll(phy);
+	if (ret)
 		goto err_disable_phy_clk;
 
 	ltq_vrx200_pcie_phy_apply_workarounds(phy);
