From: Dan Carpenter <error27@gmail.com>
Date: Wed, 21 Apr 2010 10:33:54 +0000
Subject: [patch] logfs: testing the wrong variable
Message-Id: <20100421103354.GF29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a typo here.  We should test "last" instead of "first".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/logfs/super.c b/fs/logfs/super.c
index b60bfac..1e0449e 100644
--- a/fs/logfs/super.c
+++ b/fs/logfs/super.c
@@ -377,7 +377,7 @@ static struct page *find_super_block(struct super_block *sb)
 	if (!first || IS_ERR(first))
 		return NULL;
 	last = super->s_devops->find_last_sb(sb, &super->s_sb_ofs[1]);
-	if (!last || IS_ERR(first)) {
+	if (!last || IS_ERR(last)) {
 		page_cache_release(first);
 		return NULL;
 	}
