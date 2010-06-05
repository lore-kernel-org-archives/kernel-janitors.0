From: Dan Carpenter <error27@gmail.com>
Date: Sat, 05 Jun 2010 17:16:42 +0000
Subject: [patch] Staging: mrst-touchscreen: dereferencing free memory
Message-Id: <20100605171642.GM5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I moved the kfree() down a couple lines after the dereference.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/mrst-touchscreen/intel-mid-touch.c b/drivers/staging/mrst-touchscreen/intel-mid-touch.c
index 1db0097..abba22f 100644
--- a/drivers/staging/mrst-touchscreen/intel-mid-touch.c
+++ b/drivers/staging/mrst-touchscreen/intel-mid-touch.c
@@ -817,9 +817,9 @@ static int mrstouch_remove(struct spi_device *spi)
 	free_irq(mrstouchdevp->irq, mrstouchdevp);
 	input_unregister_device(mrstouchdevp->input);
 	input_free_device(mrstouchdevp->input);
-	kfree(mrstouchdevp);
 	if (mrstouchdevp->pendet_thrd)
 		kthread_stop(mrstouchdevp->pendet_thrd);
+	kfree(mrstouchdevp);
 	return 0;
 }
 
