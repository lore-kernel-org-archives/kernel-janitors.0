From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Jul 2020 15:06:13 +0000
Subject: [PATCH][next] phy: qualcomm: fix setting of tx_deamp_3_5db when device property read fails
Message-Id: <20200721150613.416876-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when reading of the device property for "qcom,tx-deamp_3_5db"
fails the default is being assigned incorrectly to phy_dwc3->rx_eq. This
looks like a copy-n-paste error and in fact should be assigning the
default instead to phy_dwc3->tx_deamp_3_5db

Addresses-Coverity: ("Copy-paste error")
Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index a7241bf110d7..71f257b4a7f5 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -531,7 +531,7 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
 
 	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp_3_5db",
 				     &phy_dwc3->tx_deamp_3_5db))
-		phy_dwc3->rx_eq = SSPHY_TX_DEEMPH_3_5DB;
+		phy_dwc3->tx_deamp_3_5db = SSPHY_TX_DEEMPH_3_5DB;
 
 	if (device_property_read_u32(&pdev->dev, "qcom,mpll", &phy_dwc3->mpll))
 		phy_dwc3->mpll = SSPHY_MPLL_VALUE;
-- 
2.27.0
