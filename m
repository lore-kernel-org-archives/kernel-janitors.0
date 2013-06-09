From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 09 Jun 2013 13:14:25 +0000
Subject: [patch] ALSA: usx2y: remove some old dead code
Message-Id: <20130609131425.GB1442@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>

USB_QUEUE_BULK isn't defined any more.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index b376532..4967fe9 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -695,9 +695,6 @@ static int usX2Y_rate_set(struct usX2Ydev *usX2Y, int rate)
 			((char*)(usbdata + i))[1] = ra[i].c2;
 			usb_fill_bulk_urb(us->urb[i], usX2Y->dev, usb_sndbulkpipe(usX2Y->dev, 4),
 					  usbdata + i, 2, i_usX2Y_04Int, usX2Y);
-#ifdef OLD_USB
-			us->urb[i]->transfer_flags = USB_QUEUE_BULK;
-#endif
 		}
 		us->submitted =	0;
 		us->len =	NOOF_SETRATE_URBS;
