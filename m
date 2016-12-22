From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Dec 2016 19:58:51 +0000
Subject: [PATCH 1/2] [media] pvrusb2-io: Use kmalloc_array() in pvr2_stream_buffer_count()
Message-Id: <ed4b30cc-fbef-f540-3b38-562ae9fa5842@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e08ae52b-3db5-4f9a-bc8b-c5abf7700856@users.sourceforge.net>
In-Reply-To: <e08ae52b-3db5-4f9a-bc8b-c5abf7700856@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Dec 2016 19:26:52 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/pvrusb2/pvrusb2-io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-io.c b/drivers/media/usb/pvrusb2/pvrusb2-io.c
index e3103ecd4828..a01510bfc84f 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-io.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-io.c
@@ -312,7 +312,8 @@ static int pvr2_stream_buffer_count(struct pvr2_stream *sp,unsigned int cnt)
 	if (cnt > sp->buffer_total_count) {
 		if (scnt > sp->buffer_slot_count) {
 			struct pvr2_buffer **nb;
-			nb = kmalloc(scnt * sizeof(*nb),GFP_KERNEL);
+
+			nb = kmalloc_array(scnt, sizeof(*nb), GFP_KERNEL);
 			if (!nb) return -ENOMEM;
 			if (sp->buffer_slot_count) {
 				memcpy(nb,sp->buffers,
-- 
2.11.0

