From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 12:36:45 +0000
Subject: [PATCH 8/11] drivers/media: Eliminate a NULL pointer dereference
Message-Id: <Pine.LNX.4.64.1005271434030.5422@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, the print involves dereferencing a value that is NULL or is
near NULL.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E,E1;
identifier f;
statement S1,S2,S3;
@@

if ((E = NULL && ...) || ...)
{
  ... when != if (...) S1 else S2
      when != E = E1
* E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/dvb/firewire/firedtv-1394.c       |    2 +-
 drivers/media/video/hdpvr/hdpvr-video.c         |    2 +-
 drivers/media/video/usbvision/usbvision-video.c |    3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/video/usbvision/usbvision-video.c b/drivers/media/video/usbvision/usbvision-video.c
index 6248a63..c2690df 100644
--- a/drivers/media/video/usbvision/usbvision-video.c
+++ b/drivers/media/video/usbvision/usbvision-video.c
@@ -1671,8 +1671,7 @@ static void __devexit usbvision_disconnect(struct usb_interface *intf)
 	PDEBUG(DBG_PROBE, "");
 
 	if (usbvision = NULL) {
-		dev_err(&usbvision->dev->dev,
-			"%s: usb_get_intfdata() failed\n", __func__);
+		pr_err("%s: usb_get_intfdata() failed\n", __func__);
 		return;
 	}
 
diff --git a/drivers/media/video/hdpvr/hdpvr-video.c b/drivers/media/video/hdpvr/hdpvr-video.c
index 7cfccfd..c338f3f 100644
--- a/drivers/media/video/hdpvr/hdpvr-video.c
+++ b/drivers/media/video/hdpvr/hdpvr-video.c
@@ -366,7 +366,7 @@ static int hdpvr_open(struct file *file)
 
 	dev = (struct hdpvr_device *)video_get_drvdata(video_devdata(file));
 	if (!dev) {
-		v4l2_err(&dev->v4l2_dev, "open failing with with ENODEV\n");
+		pr_err("open failing with with ENODEV\n");
 		retval = -ENODEV;
 		goto err;
 	}
diff --git a/drivers/media/dvb/firewire/firedtv-1394.c b/drivers/media/dvb/firewire/firedtv-1394.c
index 26333b4..b34ca7a 100644
--- a/drivers/media/dvb/firewire/firedtv-1394.c
+++ b/drivers/media/dvb/firewire/firedtv-1394.c
@@ -58,7 +58,7 @@ static void rawiso_activity_cb(struct hpsb_iso *iso)
 	num = hpsb_iso_n_ready(iso);
 
 	if (!fdtv) {
-		dev_err(fdtv->device, "received at unknown iso channel\n");
+		pr_err("received at unknown iso channel\n");
 		goto out;
 	}
 
