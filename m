From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 13:00:11 +0000
Subject: [PATCH] fat: Delete an unnecessary check before brelse()
Message-Id: <cfff3b81-fb5d-af26-7b5e-724266509045@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Ogawa Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 14:56:16 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/fat/dir.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 1bda2ab6745b..f4bc87a3c98d 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -88,9 +88,7 @@ static int fat__get_entry(struct inode *dir, loff_t *pos,
 	int err, offset;

 next:
-	if (*bh)
-		brelse(*bh);
-
+	brelse(*bh);
 	*bh = NULL;
 	iblock = *pos >> sb->s_blocksize_bits;
 	err = fat_bmap(dir, iblock, &phys, &mapped_blocks, 0, false);
--
2.23.0
