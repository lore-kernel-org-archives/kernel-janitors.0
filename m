From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 06:36:40 +0000
Subject: [PATCH 1/3] [media] pvrusb2-ioread: Use common error handling code in pvr2_ioread_get_buffer()
Message-Id: <a104e713-00ee-54d2-7ba4-59db6384e146@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8117427-6d4d-0a1c-96c7-56e25d838b3e@users.sourceforge.net>
In-Reply-To: <c8117427-6d4d-0a1c-96c7-56e25d838b3e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Sep 2017 21:50:05 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/pvrusb2/pvrusb2-ioread.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ioread.c b/drivers/media/usb/pvrusb2/pvrusb2-ioread.c
index 602097bdcf14..0218614ce988 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ioread.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ioread.c
@@ -266,8 +266,7 @@ static int pvr2_ioread_get_buffer(struct pvr2_ioread *cp)
 				pvr2_trace(PVR2_TRACE_DATA_FLOW,
 					   "/*---TRACE_READ---*/ pvr2_ioread_read id=%p queue_error=%d",
 					   cp,stat);
-				pvr2_ioread_stop(cp);
-				return 0;
+				goto stop_read;
 			}
 			cp->c_buf = NULL;
 			cp->c_data_ptr = NULL;
@@ -286,9 +285,8 @@ static int pvr2_ioread_get_buffer(struct pvr2_ioread *cp)
 				pvr2_trace(PVR2_TRACE_DATA_FLOW,
 					   "/*---TRACE_READ---*/ pvr2_ioread_read id=%p buffer_error=%d",
 					   cp,stat);
-				pvr2_ioread_stop(cp);
 				// Give up.
-				return 0;
+				goto stop_read;
 			}
 			// Start over...
 			continue;
@@ -298,6 +296,10 @@ static int pvr2_ioread_get_buffer(struct pvr2_ioread *cp)
 			pvr2_buffer_get_id(cp->c_buf)];
 	}
 	return !0;
+
+stop_read:
+	pvr2_ioread_stop(cp);
+	return 0;
 }
 
 static void pvr2_ioread_filter(struct pvr2_ioread *cp)
-- 
2.14.1

