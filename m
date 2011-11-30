From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2011 08:42:58 +0000
Subject: [patch 2/2] Staging: comedi: unlock on error in usbduxsigma_attach()
Message-Id: <20111130084258.GB6268@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should release the udev->sem lock before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
index 0f326ca..47f872d 100644
--- a/drivers/staging/comedi/drivers/usbduxsigma.c
+++ b/drivers/staging/comedi/drivers/usbduxsigma.c
@@ -2692,6 +2692,7 @@ static int usbduxsigma_attach(struct comedi_device *dev,
 	if (ret < 0) {
 		dev_err(&udev->interface->dev,
 			"comedi%d: no space for subdev\n", dev->minor);
+		up(&udev->sem);
 		up(&start_stop_sem);
 		return ret;
 	}
