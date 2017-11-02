From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 18:33:58 +0000
Subject: [PATCH] soc/qcom/smp2p: Use common error handling code in qcom_smp2p_probe()
Message-Id: <b104bfe8-e027-f464-a4b7-e7dc03863f93@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Nov 2017 19:27:33 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace two calls of the function "dev_err" by goto statements.

* Adjust two condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/soc/qcom/smp2p.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index f51fb2ea7200..b1040943da1a 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -465,17 +465,13 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 
 	key = "qcom,local-pid";
 	ret = of_property_read_u32(pdev->dev.of_node, key, &smp2p->local_pid);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to read %s\n", key);
-		return -EINVAL;
-	}
+	if (ret)
+		goto report_read_failure;
 
 	key = "qcom,remote-pid";
 	ret = of_property_read_u32(pdev->dev.of_node, key, &smp2p->remote_pid);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to read %s\n", key);
-		return -EINVAL;
-	}
+	if (ret)
+		goto report_read_failure;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
@@ -541,6 +537,10 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	smp2p->out->valid_entries = 0;
 
 	return ret;
+
+report_read_failure:
+	dev_err(&pdev->dev, "failed to read %s\n", key);
+	return -EINVAL;
 }
 
 static int qcom_smp2p_remove(struct platform_device *pdev)
-- 
2.15.0

