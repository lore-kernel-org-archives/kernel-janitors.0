From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2011 08:42:21 +0000
Subject: [patch 1/2] Staging: comedi: unlock on error in usbdux_ao_inttrig()
Message-Id: <20111130084220.GA6268@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we had an invalid trignum (anything other than zero is invalid) then
we returned without unlocking.  I've modified this function to just have
one return point.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
index 6144afb..b4f4eec 100644
--- a/drivers/staging/comedi/drivers/usbduxsigma.c
+++ b/drivers/staging/comedi/drivers/usbduxsigma.c
@@ -1524,15 +1524,17 @@ static int usbdux_ao_inttrig(struct comedi_device *dev,
 		return -EFAULT;
 
 	down(&this_usbduxsub->sem);
+
 	if (!(this_usbduxsub->probed)) {
-		up(&this_usbduxsub->sem);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out;
 	}
 	if (trignum != 0) {
 		dev_err(&this_usbduxsub->interface->dev,
 			"comedi%d: usbdux_ao_inttrig: invalid trignum\n",
 			dev->minor);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 	if (!(this_usbduxsub->ao_cmd_running)) {
 		this_usbduxsub->ao_cmd_running = 1;
@@ -1542,8 +1544,7 @@ static int usbdux_ao_inttrig(struct comedi_device *dev,
 				"comedi%d: usbdux_ao_inttrig: submitURB: "
 				"err=%d\n", dev->minor, ret);
 			this_usbduxsub->ao_cmd_running = 0;
-			up(&this_usbduxsub->sem);
-			return ret;
+			goto out;
 		}
 		s->async->inttrig = NULL;
 	} else {
@@ -1551,8 +1552,10 @@ static int usbdux_ao_inttrig(struct comedi_device *dev,
 			"comedi%d: ao_inttrig but acqu is already running.\n",
 			dev->minor);
 	}
+	ret = 1;
+out:
 	up(&this_usbduxsub->sem);
-	return 1;
+	return ret;
 }
 
 static int usbdux_ao_cmdtest(struct comedi_device *dev,
