From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 20:24:51 +0000
Subject: [PATCH] tty: synclinkmp: Delete an error message for a failed memory allocation in startup()
Message-Id: <8a63c9bc-77c3-5b7e-6911-86397e63abd7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 21:21:07 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/synclinkmp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/synclinkmp.c b/drivers/tty/synclinkmp.c
index d45f234e1914..e47d19bbe87a 100644
--- a/drivers/tty/synclinkmp.c
+++ b/drivers/tty/synclinkmp.c
@@ -2640,11 +2640,8 @@ static int startup(SLMP_INFO * info)
 
 	if (!info->tx_buf) {
 		info->tx_buf = kmalloc(info->max_frame_size, GFP_KERNEL);
-		if (!info->tx_buf) {
-			printk(KERN_ERR"%s(%d):%s can't allocate transmit buffer\n",
-				__FILE__,__LINE__,info->device_name);
+		if (!info->tx_buf)
 			return -ENOMEM;
-		}
 	}
 
 	info->pending_bh = 0;
-- 
2.15.1

