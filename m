From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 13:53:53 +0000
Subject: [PATCH 1/6] [media] go7007: Delete an error message for a failed memory allocation in go7007_load_en
Message-Id: <ce46e264-73fe-4613-e1b8-79a4bccc796b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b36ece3f-0f31-9bb6-14ae-c4abf7cd23ee@users.sourceforge.net>
In-Reply-To: <b36ece3f-0f31-9bb6-14ae-c4abf7cd23ee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 10:52:42 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/go7007/go7007-driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index 05b1126f263e..222332189fa4 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -107,4 +107,3 @@ static int go7007_load_encoder(struct go7007 *go)
-			v4l2_err(go, "unable to allocate %d bytes for firmware transfer\n", fw_len);
 			release_firmware(fw_entry);
 			return -1;
 		}
-- 
2.14.1

