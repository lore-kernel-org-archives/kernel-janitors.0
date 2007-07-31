From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:02:10 +0000
Subject: [PATCH 70] drivers/mtd/ubi/scan.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010002.11418.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: dwmw2@infradead.org, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org

To be able to convert kmalloc + memset(..., 1, ...) to kzalloc this patch
reverses the logic around 'buf'.

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mtd/ubi/scan.c | 35563 -> 35531 (-32 bytes)
 drivers/mtd/ubi/scan.o | 125124 -> 124564 (-560 bytes)

 drivers/mtd/ubi/scan.c |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mtd/ubi/scan.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mtd/ubi/scan.c	2007-07-31 11:42:42.000000000 +0200
@@ -1314,11 +1314,10 @@ static int paranoid_check_si(const struc
 	 * Make sure that all the physical eraseblocks are in one of the lists
 	 * or trees.
 	 */
-	buf = kmalloc(ubi->peb_count, GFP_KERNEL);
+	buf = kzalloc(ubi->peb_count, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;

-	memset(buf, 1, ubi->peb_count);
 	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
 		err = ubi_io_is_bad(ubi, pnum);
 		if (err < 0) {
@@ -1326,28 +1325,28 @@ static int paranoid_check_si(const struc
 			return err;
 		}
 		else if (err)
-			buf[pnum] = 0;
+			buf[pnum] = 1;
 	}

 	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb)
 		ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb)
-			buf[seb->pnum] = 0;
+			buf[seb->pnum] = 1;

 	list_for_each_entry(seb, &si->free, u.list)
-		buf[seb->pnum] = 0;
+		buf[seb->pnum] = 1;

 	list_for_each_entry(seb, &si->corr, u.list)
-		buf[seb->pnum] = 0;
+		buf[seb->pnum] = 1;

 	list_for_each_entry(seb, &si->erase, u.list)
-		buf[seb->pnum] = 0;
+		buf[seb->pnum] = 1;

 	list_for_each_entry(seb, &si->alien, u.list)
-		buf[seb->pnum] = 0;
+		buf[seb->pnum] = 1;

 	err = 0;
 	for (pnum = 0; pnum < ubi->peb_count; pnum++)
-		if (buf[pnum]) {
+		if (!buf[pnum]) {
 			ubi_err("PEB %d is not referred", pnum);
 			err = 1;
 		}
