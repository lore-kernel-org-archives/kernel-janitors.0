From: Dan Carpenter <error27@gmail.com>
Date: Mon, 31 May 2010 12:01:22 +0000
Subject: [patch 1/2] input/tps6507x-ts: dereferencing before checking
Message-Id: <20100531120122.GR5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Todd Fischer <todd.fischer@ridgerun.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch moves the dereference after the check for NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/input/touchscreen/tps6507x-ts.c b/drivers/input/touchscreen/tps6507x-ts.c
index 5de80a1..b99db09 100644
--- a/drivers/input/touchscreen/tps6507x-ts.c
+++ b/drivers/input/touchscreen/tps6507x-ts.c
@@ -355,10 +355,11 @@ static int __devexit tps6507x_ts_remove(struct platform_device *pdev)
 {
 	struct tps6507x_dev *tps6507x_dev = platform_get_drvdata(pdev);
 	struct tps6507x_ts *tsc = tps6507x_dev->ts;
-	struct input_dev *input_dev = tsc->input_dev;
+	struct input_dev *input_dev;
 
 	if (!tsc)
 		return 0;
+	input_dev = tsc->input_dev;
 
 	cancel_delayed_work(&tsc->work);
 	flush_workqueue(tsc->wq);
