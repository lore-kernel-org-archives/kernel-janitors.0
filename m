From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 08 Aug 2017 10:58:32 +0000
Subject: [PATCH 6/6] [media] uvcvideo: constify video_subdev structures
Message-Id: <1502189912-28794-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502189912-28794-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502189912-28794-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

uvc_subdev_ops is only passed as the second argument of
v4l2_subdev_init, which is const, so uvc_subdev_ops can be
const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/usb/uvc/uvc_entity.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index ac386bb..554063c 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -61,7 +61,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 	return 0;
 }
 
-static struct v4l2_subdev_ops uvc_subdev_ops = {
+static const struct v4l2_subdev_ops uvc_subdev_ops = {
 };
 
 void uvc_mc_cleanup_entity(struct uvc_entity *entity)

