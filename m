From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 12 Jul 2010 14:48:04 +0000
Subject: [PATCH] staging: mrst-touchscreen: fix leaks
Message-Id: <1278946084-30228-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Dan Carpenter <error27@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

mrstouch_probe() must unregister input device, free requested IRQ and
input device in error path.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/mrst-touchscreen/intel-mid-touch.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mrst-touchscreen/intel-mid-touch.c b/drivers/staging/mrst-touchscreen/intel-mid-touch.c
index abba22f..8a72bbf 100644
--- a/drivers/staging/mrst-touchscreen/intel-mid-touch.c
+++ b/drivers/staging/mrst-touchscreen/intel-mid-touch.c
@@ -779,7 +779,7 @@ static int __devinit mrstouch_probe(struct spi_device *mrstouch_spi)
 				0, "mrstouch", tsdev);
 	if (err) {
 		dev_err(&tsdev->spi->dev, "unable to allocate irq\n");
-		goto mrstouch_err_free_mem;
+		goto mrstouch_err_unreg_input;
 	}
 
 	tsdev->pendet_thrd = kthread_run(mrstouch_pendet,
@@ -787,11 +787,16 @@ static int __devinit mrstouch_probe(struct spi_device *mrstouch_spi)
 	if (IS_ERR(tsdev->pendet_thrd)) {
 		dev_err(&tsdev->spi->dev, "kthread_run failed\n");
 		err = PTR_ERR(tsdev->pendet_thrd);
-		goto mrstouch_err_free_mem;
+		goto mrstouch_err_free_irq;
 	}
 	mrstouch_debug("%s", "Driver initialized");
 	return 0;
 
+mrstouch_err_free_irq:
+	free_irq(myirq, tsdev);
+mrstouch_err_unreg_input:
+	input_unregister_device(mrstouchdevp->input);
+	input_free_device(mrstouchdevp->input);
 mrstouch_err_free_mem:
 	kfree(tsdev);
 	return err;
-- 
1.7.0.4

