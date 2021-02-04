From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Feb 2021 18:03:13 +0000
Subject: [PATCH] phy: qcom-qmp: make a const array static, makes object smaller
Message-Id: <20210204180313.108876-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array cfg1_settings on the stack but instead make
it static. Makes the object code smaller by 24 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  73585	  20240	     64	  93889	  16ec1	drivers/phy/qualcomm/phy-qcom-qmp.o

After:
   text	   data	    bss	    dec	    hex	filename
  73465	  20336	     64	  93865	  16ea9	drivers/phy/qualcomm/phy-qcom-qmp.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index a679b5fb7b48..d0dfb6743965 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3421,7 +3421,7 @@ static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
 static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
+	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
 	u8 val;
 
 	qphy->dp_aux_cfg++;
-- 
2.29.2
