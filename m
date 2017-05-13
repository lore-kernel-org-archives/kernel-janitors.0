From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 08:55:16 +0000
Subject: [PATCH 1/2] ipack: Delete an error message for a failed memory allocation in ipack_device_read_id()
Message-Id: <2ef624df-6872-a0eb-90bd-4db6b2a248ae@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b3fea957-b1bf-f681-8f70-d9d85106651b@users.sourceforge.net>
In-Reply-To: <b3fea957-b1bf-f681-8f70-d9d85106651b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: industrypack-devel@lists.sourceforge.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Taprogge <jens.taprogge@taprogge.org>, Samuel Iglesias Gonsalvez <siglesias@igalia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 10:20:07 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ipack/ipack.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
index 12102448fddd..575c4f29e0f7 100644
--- a/drivers/ipack/ipack.c
+++ b/drivers/ipack/ipack.c
@@ -402,7 +402,6 @@ static int ipack_device_read_id(struct ipack_device *dev)
 	 * ID ROM contents */
 	dev->id = kmalloc(dev->id_avail, GFP_KERNEL);
 	if (!dev->id) {
-		dev_err(&dev->dev, "dev->id alloc failed.\n");
 		ret = -ENOMEM;
 		goto out;
 	}
-- 
2.12.3

