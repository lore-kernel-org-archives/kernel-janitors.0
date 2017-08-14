From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 14 Aug 2017 05:58:37 +0000
Subject: [PATCH] [media] pxa_camera: constify v4l2_clk_ops structure
Message-Id: <1502690317-9478-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

This v4l2_clk_ops structure is only passed as the first argument of
v4l2_clk_register, which is const, so the v4l2_clk_ops structure can
also be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/platform/pxa_camera.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 0d4af6d..4a800a4 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2100,7 +2100,7 @@ static int pxac_fops_camera_release(struct file *filp)
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
 
-static struct v4l2_clk_ops pxa_camera_mclk_ops = {
+static const struct v4l2_clk_ops pxa_camera_mclk_ops = {
 };
 
 static const struct video_device pxa_camera_videodev_template = {

