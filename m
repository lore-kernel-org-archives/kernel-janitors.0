From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Oct 2015 11:57:13 +0000
Subject: [PATCH] [media] mt9t001: constify v4l2_subdev_internal_ops structure
Message-Id: <1444564633-19861-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

This v4l2_subdev_internal_ops structure is never modified.  All other
v4l2_subdev_internal_ops structures are declared as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/i2c/mt9t001.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9t001.c b/drivers/media/i2c/mt9t001.c
index 8ae99f7..4383a5d 100644
--- a/drivers/media/i2c/mt9t001.c
+++ b/drivers/media/i2c/mt9t001.c
@@ -834,7 +834,7 @@ static struct v4l2_subdev_ops mt9t001_subdev_ops = {
 	.pad = &mt9t001_subdev_pad_ops,
 };
 
-static struct v4l2_subdev_internal_ops mt9t001_subdev_internal_ops = {
+static const struct v4l2_subdev_internal_ops mt9t001_subdev_internal_ops = {
 	.registered = mt9t001_registered,
 	.open = mt9t001_open,
 	.close = mt9t001_close,

