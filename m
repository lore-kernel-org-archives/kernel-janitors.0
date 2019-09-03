From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 19:15:58 +0000
Subject: [PATCH] fs-udf: Delete an unnecessary check before brelse()
Message-Id: <a254c1d1-0109-ab51-c67a-edc5c1c4b4cd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 21:12:09 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/udf/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 56da1e1680ea..0cd0be642a2f 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -273,8 +273,7 @@ static void udf_sb_free_bitmap(struct udf_bitmap *bitmap)
 	int nr_groups = bitmap->s_nr_groups;

 	for (i = 0; i < nr_groups; i++)
-		if (bitmap->s_block_bitmap[i])
-			brelse(bitmap->s_block_bitmap[i]);
+		brelse(bitmap->s_block_bitmap[i]);

 	kvfree(bitmap);
 }
--
2.23.0
