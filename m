From: Dan Carpenter <error27@gmail.com>
Date: Mon, 31 May 2010 12:02:15 +0000
Subject: [patch 2/2] input/tps6507x-ts: zero vs NULL
Message-Id: <20100531120215.GS5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Todd Fischer <todd.fischer@ridgerun.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch silences a sparse warning:

drivers/input/touchscreen/tps6507x-ts.c:345:19:
	warning: Using plain integer as NULL pointer
drivers/input/touchscreen/tps6507x-ts.c:367:19:
	warning: Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/input/touchscreen/tps6507x-ts.c b/drivers/input/touchscreen/tps6507x-ts.c
index b99db09..1e57e4e 100644
--- a/drivers/input/touchscreen/tps6507x-ts.c
+++ b/drivers/input/touchscreen/tps6507x-ts.c
@@ -342,7 +342,7 @@ err2:
 	cancel_delayed_work(&tsc->work);
 	flush_workqueue(tsc->wq);
 	destroy_workqueue(tsc->wq);
-	tsc->wq = 0;
+	tsc->wq = NULL;
 	input_free_device(input_dev);
 err1:
 	kfree(tsc);
@@ -364,7 +364,7 @@ static int __devexit tps6507x_ts_remove(struct platform_device *pdev)
 	cancel_delayed_work(&tsc->work);
 	flush_workqueue(tsc->wq);
 	destroy_workqueue(tsc->wq);
-	tsc->wq = 0;
+	tsc->wq = NULL;
 
 	input_free_device(input_dev);
 
