From: Dan Carpenter <error27@gmail.com>
Date: Thu, 30 Jun 2011 09:02:05 +0000
Subject: [patch] Staging: comedi: usbdux: release locks on error paths
Message-Id: <20110630090205.GM14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains about a couple error paths where the semaphores
were not released.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index 6637698..bf62e0d 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -1465,6 +1465,7 @@ static int usbdux_ao_inttrig(struct comedi_device *dev,
 		dev_err(&this_usbduxsub->interface->dev,
 			"comedi%d: usbdux_ao_inttrig: invalid trignum\n",
 			dev->minor);
+		up(&this_usbduxsub->sem);
 		return -EINVAL;
 	}
 	if (!(this_usbduxsub->ao_cmd_running)) {
@@ -2671,6 +2672,7 @@ static int usbdux_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	if (ret < 0) {
 		dev_err(&udev->interface->dev,
 			"comedi%d: error alloc space for subdev\n", dev->minor);
+		up(&udev->sem);
 		up(&start_stop_sem);
 		return ret;
 	}
