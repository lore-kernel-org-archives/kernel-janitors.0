From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 19:33:44 +0000
Subject: [patch] logfs: signedness issue in mtd_find_last_sb()
Message-Id: <20100910193344.GG5959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"*ofs" is unsigned here so it's never less than zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was found by a static checker and I have only compile tested it.
Sorry about that.

diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index a85d47d..99b3d4c 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -175,9 +175,9 @@ static struct page *mtd_find_last_sb(struct super_block *sb, u64 *ofs)
 
 	*ofs = mtd->size - mtd->erasesize;
 	while (mtd->block_isbad(mtd, *ofs)) {
-		*ofs -= mtd->erasesize;
-		if (*ofs <= 0)
+		if (*ofs <= mtd->erasesize)
 			return NULL;
+		*ofs -= mtd->erasesize;
 	}
 	*ofs = *ofs + mtd->erasesize - 0x1000;
 	BUG_ON(*ofs & ~PAGE_MASK);
