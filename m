From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Jan 2019 14:08:20 +0000
Subject: [PATCH] mtd: part: fix incorrect format specifier for an unsigned long long
Message-Id: <20190131140820.7422-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An unsigned long long is being formatted with %lld instead of the unsigned
version %llu. Fix this.

Clean up cppcheck warning:
%lld in format string (no. 1) requires 'long long' but the argument type
is 'unsigned long long'.

Fixes: a62c24d75529 ("mtd: part: Add sysfs variable for offset of partition")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 60104e1079c5..cca681b1a514 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -568,7 +568,7 @@ static ssize_t mtd_partition_offset_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_part *part = mtd_to_part(mtd);
-	return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
+	return snprintf(buf, PAGE_SIZE, "%llu\n", part->offset);
 }
 
 static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
-- 
2.20.1
