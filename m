From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:45:29 +0000
Subject: [PATCH 13/19] [media] uvc_video: Use kmalloc_array() in uvc_video_clock_init()
Message-Id: <47b935d9-e063-503a-47e5-2aee2ffe149c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
In-Reply-To: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 16:45:21 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f3c1c852e401..05b396f033ca 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -500,9 +500,9 @@ static int uvc_video_clock_init(struct uvc_streaming *stream)
 
 	spin_lock_init(&clock->lock);
 	clock->size = 32;
-
-	clock->samples = kmalloc(clock->size * sizeof(*clock->samples),
-				 GFP_KERNEL);
+	clock->samples = kmalloc_array(clock->size,
+				       sizeof(*clock->samples),
+				       GFP_KERNEL);
 	if (clock->samples = NULL)
 		return -ENOMEM;
 
-- 
2.11.0

