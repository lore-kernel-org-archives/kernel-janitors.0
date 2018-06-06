From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Jun 2018 14:22:24 +0000
Subject: [PATCH -next] usb: dwc3: Fix error return code in dwc3_qcom_probe()
Message-Id: <1528294944-177096-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manu Gautam <mgautam@codeaurora.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENODEV from the get device failed error
handling case instead of 0, as done elsewhere in this function.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index b0e67ab..8854e42 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -490,6 +490,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	qcom->dwc3 = of_find_device_by_node(dwc3_np);
 	if (!qcom->dwc3) {
 		dev_err(&pdev->dev, "failed to get dwc3 platform device\n");
+		ret = -ENODEV;
 		goto depopulate;
 	}

