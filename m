From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 20:20:37 +0000
Subject: [PATCH] init: Delete an error message for a failed memory allocation in rd_load_image()
Message-Id: <b08e4c5c-0d6e-ae13-5c5d-a4860e8199eb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Schichan <nicolas.schichan@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 22:14:36 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 init/do_mounts_rd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index dd4104c9aa12..47cafb189ad3 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -245,10 +245,8 @@ int __init rd_load_image(char *from)
 	}
 
 	buf = kmalloc(BLOCK_SIZE, GFP_KERNEL);
-	if (!buf) {
-		printk(KERN_ERR "RAMDISK: could not allocate buffer\n");
+	if (!buf)
 		goto done;
-	}
 
 	printk(KERN_NOTICE "RAMDISK: Loading %dKiB [%ld disk%s] into ram disk... ",
 		nblocks, ((nblocks-1)/devblocks)+1, nblocks>devblocks ? "s" : "");
-- 
2.13.0

