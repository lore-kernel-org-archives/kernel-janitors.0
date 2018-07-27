From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 27 Jul 2018 07:15:15 +0000
Subject: [PATCH -next] staging: axis-fifo: fix return value check in axis_fifo_probe()
Message-Id: <1532675715-122016-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacob Feder <jacobsfeder@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function device_create() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 2a73302..51a081d 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -1006,10 +1006,10 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	/* create driver file */
 	fifo->device = device_create(axis_fifo_driver_class, NULL, fifo->devt,
 				     NULL, device_name);
-	if (!fifo->device) {
+	if (IS_ERR(fifo->device)) {
 		dev_err(fifo->dt_device,
 			"couldn't create driver file\n");
-		rc = -ENOMEM;
+		rc = PTR_ERR(fifo->device);
 		goto err_chrdev_region;
 	}
 	dev_set_drvdata(fifo->device, fifo);

