From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:51 +0000
Subject: [PATCH] staging: stradis: fix error handling and information leak to userland
Message-Id: <1286731732-18082-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

configure_saa7146() didn't free irq on error.
saa_open() didn't decrease reference count of saa on error.
saa_ioctl() leaked information from the kernel stack to userland as it
didn't fill copied structs with zeros.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/stradis/stradis.c |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/stradis/stradis.c b/drivers/staging/stradis/stradis.c
index a057824..807dd7e 100644
--- a/drivers/staging/stradis/stradis.c
+++ b/drivers/staging/stradis/stradis.c
@@ -1286,6 +1286,7 @@ static long saa_ioctl(struct file *file,
 	case VIDIOCGCAP:
 		{
 			struct video_capability b;
+			memset(&b, 0, sizeof(b));
 			strcpy(b.name, saa->video_dev.name);
 			b.type = VID_TYPE_CAPTURE | VID_TYPE_OVERLAY |
 				VID_TYPE_CLIPPING | VID_TYPE_FRAMERAM |
@@ -1416,6 +1417,7 @@ static long saa_ioctl(struct file *file,
 	case VIDIOCGWIN:
 		{
 			struct video_window vw;
+			memset(&vw, 0, sizeof(vw));
 			vw.x = saa->win.x;
 			vw.y = saa->win.y;
 			vw.width = saa->win.width;
@@ -1448,6 +1450,7 @@ static long saa_ioctl(struct file *file,
 	case VIDIOCGFBUF:
 		{
 			struct video_buffer v;
+			memset(&v, 0, sizeof(v));
 			v.base = (void *)saa->win.vidadr;
 			v.height = saa->win.sheight;
 			v.width = saa->win.swidth;
@@ -1492,6 +1495,7 @@ static long saa_ioctl(struct file *file,
 	case VIDIOCGAUDIO:
 		{
 			struct video_audio v;
+			memset(&v, 0, sizeof(v));
 			v = saa->audio_dev;
 			v.flags &= ~(VIDEO_AUDIO_MUTE | VIDEO_AUDIO_MUTABLE);
 			v.flags |= VIDEO_AUDIO_MUTABLE | VIDEO_AUDIO_VOLUME;
@@ -1534,6 +1538,7 @@ static long saa_ioctl(struct file *file,
 	case VIDIOCGUNIT:
 		{
 			struct video_unit vu;
+			memset(&vu, 0, sizeof(vu));
 			vu.video = saa->video_dev.minor;
 			vu.vbi = VIDEO_NO_UNIT;
 			vu.radio = VIDEO_NO_UNIT;
@@ -1888,6 +1893,7 @@ static int saa_open(struct file *file)
 
 	saa->user++;
 	if (saa->user > 1) {
+		saa->user--;
 		unlock_kernel();
 		return 0;	/* device open already, don't reset */
 	}
@@ -2000,10 +2006,13 @@ static int __devinit configure_saa7146(struct pci_dev *pdev, int num)
 	if (retval < 0) {
 		dev_err(&pdev->dev, "%d: error in registering video device!\n",
 			num);
-		goto errio;
+		goto errirq;
 	}
 
 	return 0;
+
+errirq:
+	free_irq(saa->irq, saa);
 errio:
 	iounmap(saa->saa7146_mem);
 err:
-- 
1.7.0.4

