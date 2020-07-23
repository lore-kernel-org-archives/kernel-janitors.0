From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 23 Jul 2020 11:36:22 +0000
Subject: [PATCH -next] phy: qualcomm: fix return value check in qcom_ipq806x_usb_phy_probe()
Message-Id: <20200723113622.136752-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 71f257b4a7f5..092fd2d9c3f3 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -505,9 +505,9 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
 	size = resource_size(res);
 	phy_dwc3->base = devm_ioremap(phy_dwc3->dev, res->start, size);
 
-	if (IS_ERR(phy_dwc3->base)) {
+	if (!phy_dwc3->base) {
 		dev_err(phy_dwc3->dev, "failed to map reg\n");
-		return PTR_ERR(phy_dwc3->base);
+		return -ENOMEM;
 	}
 
 	phy_dwc3->ref_clk = devm_clk_get(phy_dwc3->dev, "ref");
