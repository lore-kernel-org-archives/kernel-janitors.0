From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:42 +0000
Subject: [PATCH 09/12] [media] pvrusb2: drop unneeded newline
Message-Id: <1514386305-7402-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

pvr2_trace prints a newline at the end of the message string, so the
message string does not need to include a newline explicitly.  Done
using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 09bd6c6..e035316 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2351,7 +2351,8 @@ struct pvr2_hdw *pvr2_hdw_create(struct usb_interface *intf,
 
 	if (hdw_desc = NULL) {
 		pvr2_trace(PVR2_TRACE_INIT, "pvr2_hdw_create: No device description pointer, unable to continue.");
-		pvr2_trace(PVR2_TRACE_INIT, "If you have a new device type, please contact Mike Isely <isely@pobox.com> to get it included in the driver\n");
+		pvr2_trace(PVR2_TRACE_INIT,
+			   "If you have a new device type, please contact Mike Isely <isely@pobox.com> to get it included in the driver");
 		goto fail;
 	}
 

