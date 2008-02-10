From: Julia Lawall <julia@diku.dk>
Date: Sun, 10 Feb 2008 20:08:49 +0000
Subject: [PATCH 2/8] drivers/block: Use FIELD_SIZEOF
Message-Id: <Pine.LNX.4.64.0802102108000.23906@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfr@canb.auug.org.au, axboe@kernel.dk
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Robert P.J. Day proposed to use the macro FIELD_SIZEOF in replace of code
that matches its definition.

The modification was made using the following semantic patch
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
type t;
identifier f;
@@

- (sizeof(((t*)0)->f))
+ FIELD_SIZEOF(t, f)

@depends on haskernel@
type t;
identifier f;
@@

- sizeof(((t*)0)->f)
+ FIELD_SIZEOF(t, f)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/block/viodasd.c b/drivers/block/viodasd.c
--- a/drivers/block/viodasd.c 2008-02-02 15:28:17.000000000 +0100
+++ b/drivers/block/viodasd.c 2008-02-10 17:42:42.000000000 +0100
@@ -69,7 +69,7 @@ MODULE_LICENSE("GPL");
 enum {
 	PARTITION_SHIFT = 3,
 	MAX_DISKNO = HVMAXARCHITECTEDVIRTUALDISKS,
-	MAX_DISK_NAME = sizeof(((struct gendisk *)0)->disk_name)
+	MAX_DISK_NAME = FIELD_SIZEOF(struct gendisk, disk_name)
 };
 
 static DEFINE_SPINLOCK(viodasd_spinlock);
