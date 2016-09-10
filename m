From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:26:16 +0000
Subject: [PATCH 2/7] cfag12864b: Delete an error message for a failed kmalloc_array() call
Message-Id: <0a01ed52-b852-ccfd-b834-df06f8cd2915@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
In-Reply-To: <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:54:05 +0200

Omit an extra message for a memory allocation failure in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864b.c
index 88260f4..fd07fad 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -351,9 +351,6 @@ static int __init cfag12864b_init(void)
 					 sizeof(*cfag12864b_cache),
 					 GFP_KERNEL);
 	if (cfag12864b_cache = NULL) {
-		printk(KERN_ERR CFAG12864B_NAME ": ERROR: "
-			"can't alloc cache buffer (%i bytes)\n",
-			CFAG12864B_SIZE);
 		ret = -ENOMEM;
 		goto bufferalloced;
 	}
-- 
2.10.0

