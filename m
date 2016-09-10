From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:23:57 +0000
Subject: [PATCH 1/7] cfag12864b: Use kmalloc_array() in cfag12864b_init()
Message-Id: <e80b7194-e189-9568-267d-e1e8e1cb9cde@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
In-Reply-To: <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:40:48 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864b.c
index 41ce4bd..88260f4 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -347,8 +347,9 @@ static int __init cfag12864b_init(void)
 		goto none;
 	}
 
-	cfag12864b_cache = kmalloc(sizeof(unsigned char) *
-		CFAG12864B_SIZE, GFP_KERNEL);
+	cfag12864b_cache = kmalloc_array(CFAG12864B_SIZE,
+					 sizeof(*cfag12864b_cache),
+					 GFP_KERNEL);
 	if (cfag12864b_cache = NULL) {
 		printk(KERN_ERR CFAG12864B_NAME ": ERROR: "
 			"can't alloc cache buffer (%i bytes)\n",
-- 
2.10.0

