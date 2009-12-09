From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:23:49 +0000
Subject: [PATCH 5/12] drivers/media/video/uvc: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092023310.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@skynet.be>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/uvc/uvc_video.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/media/video/uvc/uvc_video.c b/drivers/media/video/uvc/uvc_video.c
--- a/drivers/media/video/uvc/uvc_video.c
+++ b/drivers/media/video/uvc/uvc_video.c
@@ -145,7 +145,7 @@ static int uvc_get_video_ctrl(struct uvc
 		uvc_warn_once(stream->dev, UVC_WARN_MINMAX, "UVC non "
 			"compliance - GET_MIN/MAX(PROBE) incorrectly "
 			"supported. Enabling workaround.\n");
-		memset(ctrl, 0, sizeof ctrl);
+		memset(ctrl, 0, sizeof *ctrl);
 		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
 		ret = 0;
 		goto out;
