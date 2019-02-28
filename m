From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2019 05:35:51 +0000
Subject: [PATCH] ubi: wl: Silence uninitialized variable warning
Message-Id: <20190228053551.GB3253@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <bbrezillon@kernel.org>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

This condition needs to be fipped around because "err" is uninitialized
when "force" is set.  The Smatch static analysis tool complains and
UBsan will also complain at runtime.

Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 40f838d54b0f..2709dc02fc24 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1517,7 +1517,7 @@ int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
 		mutex_unlock(&ubi->buf_mutex);
 	}
 
-	if (err = UBI_IO_BITFLIPS || force) {
+	if (force || err = UBI_IO_BITFLIPS) {
 		/*
 		 * Okay, bit flip happened, let's figure out what we can do.
 		 */
-- 
2.17.1
