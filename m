From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 18:42:11 +0000
Subject: [PATCH] reiserfs: Delete an unnecessary check before brelse()
Message-Id: <b3b79aaf-279b-4f5a-b9ee-3a38b74da98e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, "Darrick J. Wong" <darrick.wong@oracle.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Jeff Layton <jlayton@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 20:00:16 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/reiserfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index d69b4ac0ae2f..b412ef9a24a6 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2229,8 +2229,7 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 	reiserfs_cancel_old_flush(s);

 	reiserfs_free_bitmap_cache(s);
-	if (SB_BUFFER_WITH_SB(s))
-		brelse(SB_BUFFER_WITH_SB(s));
+	brelse(SB_BUFFER_WITH_SB(s));
 #ifdef CONFIG_QUOTA
 	{
 		int j;
--
2.23.0
