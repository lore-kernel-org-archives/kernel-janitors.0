From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Apr 2017 08:32:53 +0000
Subject: [PATCH] rtc: hid-sensor-time: remove some dead code
Message-Id: <20170412083253.GB3250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, kernel-janitors@vger.kernel.org

devm_rtc_device_register() doesn't ever return NULL so there is no need
to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-hid-sensor-time.c b/drivers/rtc/rtc-hid-sensor-time.c
index c398f74234c6..2751dba850c6 100644
--- a/drivers/rtc/rtc-hid-sensor-time.c
+++ b/drivers/rtc/rtc-hid-sensor-time.c
@@ -291,9 +291,9 @@ static int hid_time_probe(struct platform_device *pdev)
 					"hid-sensor-time", &hid_time_rtc_ops,
 					THIS_MODULE);
 
-	if (IS_ERR_OR_NULL(time_state->rtc)) {
+	if (IS_ERR(time_state->rtc)) {
 		hid_device_io_stop(hsdev->hdev);
-		ret = time_state->rtc ? PTR_ERR(time_state->rtc) : -ENODEV;
+		ret = PTR_ERR(time_state->rtc);
 		time_state->rtc = NULL;
 		dev_err(&pdev->dev, "rtc device register failed!\n");
 		goto err_rtc;
