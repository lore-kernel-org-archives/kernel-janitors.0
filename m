From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jun 2012 07:14:59 +0000
Subject: [patch] staging: comedi: double unlock in usbduxsigma_attach()
Message-Id: <20120622071459.GB27618@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was a double unlock introduced in 60ff461067 ("staging: comedi:
usbduxsigma: use attach_usb() hook").

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
index 28f41e9..015b0d0 100644
--- a/drivers/staging/comedi/drivers/usbduxsigma.c
+++ b/drivers/staging/comedi/drivers/usbduxsigma.c
@@ -2781,7 +2781,6 @@ static int usbduxsigma_attach(struct comedi_device *dev,
 	if (index < 0) {
 		dev_err(dev->class_dev,
 			"usbduxsigma: error: attach failed, dev not connected to the usb bus.\n");
-		up(&start_stop_sem);
 		ret = -ENODEV;
 	} else
 		ret = usbduxsigma_attach_common(dev, &usbduxsub[index],
