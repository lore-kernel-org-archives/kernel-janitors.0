From: Julia Lawall <julia@diku.dk>
Date: Mon, 28 Dec 2009 14:09:55 +0000
Subject: [PATCH] drivers/media/video: Correct NULL test
Message-Id: <Pine.LNX.4.64.0912281509340.6928@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the just-allocated value for NULL rather than some other value.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier f;
@@

f(...) { <+... return NULL; ...+> }

@@
expression *x;
expression y;
identifier r.f;
statement S;
@@

x = f(...);
(
if ((x) = NULL) S
|
if (
-   y
+   x
       = NULL)
 S
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/usbvision/usbvision-video.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/media/video/usbvision/usbvision-video.c b/drivers/media/video/usbvision/usbvision-video.c
--- a/drivers/media/video/usbvision/usbvision-video.c
+++ b/drivers/media/video/usbvision/usbvision-video.c
@@ -1487,7 +1487,7 @@ static int __devinit usbvision_register_
 		usbvision->vbi = usbvision_vdev_init(usbvision,
 						     &usbvision_vbi_template,
 						     "USBVision VBI");
-		if (usbvision->vdev = NULL) {
+		if (usbvision->vbi = NULL) {
 			goto err_exit;
 		}
 		if (video_register_device(usbvision->vbi,
