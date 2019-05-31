From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 12:05:59 +0000
Subject: [PATCH] phy: qcom-qusb2: fix missing assignment of ret when calling clk_prepare_enable
Message-Id: <20190531120559.2202-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error return from the call to clk_prepare_enable is not being assigned
to variable ret even though ret is being used to check if the call failed.
Fix this by adding in the missing assignment.

Addresses-Coverity: ("Logically dead code")
Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1cbf1d6f28ce..bf94a52d3087 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -564,7 +564,7 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
 	}
 
 	if (!qphy->has_se_clk_scheme) {
-		clk_prepare_enable(qphy->ref_clk);
+		ret = clk_prepare_enable(qphy->ref_clk);
 		if (ret) {
 			dev_err(dev, "failed to enable ref clk, %d\n", ret);
 			goto disable_ahb_clk;
-- 
2.20.1
