From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 12:44:07 +0000
Subject: [PATCH] xtensa-simdisk: Use kmalloc_array() in simdisk_init()
Message-Id: <dbf33595-b8df-4082-c78f-4821403edee0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Chris Zankel <chris@zankel.net>, Jens Axboe <axboe@fb.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 14:28:09 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/xtensa/platforms/iss/simdisk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
index f58a4e6..0a86292 100644
--- a/arch/xtensa/platforms/iss/simdisk.c
+++ b/arch/xtensa/platforms/iss/simdisk.c
@@ -316,8 +316,7 @@ static int __init simdisk_init(void)
 	if (simdisk_count > MAX_SIMDISK_COUNT)
 		simdisk_count = MAX_SIMDISK_COUNT;
 
-	sddev = kmalloc(simdisk_count * sizeof(struct simdisk),
-			GFP_KERNEL);
+	sddev = kmalloc_array(simdisk_count, sizeof(*sddev), GFP_KERNEL);
 	if (sddev = NULL)
 		goto out_unregister;
 
-- 
2.9.3

