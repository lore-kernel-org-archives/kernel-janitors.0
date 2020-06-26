From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jun 2020 10:45:26 +0000
Subject: [PATCH] media: uvcvideo: Fix loop exit condition in uvc_xu_ctrl_query()
Message-Id: <20200626104526.GE314359@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The list_for_each_entry() loop exits when "entity" is a offset off the
list head.  In that situation the "entity" pointer doesn't point to a
valid uvc_entity struct, so it doesn't make sense to check "entity->id".
Since the "entity->id" is a u8 it's plausible that it could be equal to
"xqry->unit" by chance.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e399b9fad757..47ab6c315db6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1857,7 +1857,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 			break;
 	}
 
-	if (entity->id != xqry->unit) {
+	if (&entity->chain = &chain->entities) {
 		uvc_trace(UVC_TRACE_CONTROL, "Extension unit %u not found.\n",
 			xqry->unit);
 		return -ENOENT;
-- 
2.27.0
