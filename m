From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2013 10:21:54 +0000
Subject: [patch] quota: info leak in quota_getquota()
Message-Id: <20131101102154.GC29795@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The if_dqblk struct has a 4 byte hole at the end of the struct so
uninitialized stack information is leaked to user space.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index dea86e8..2b363e2 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -117,6 +117,7 @@ static int quota_setinfo(struct super_block *sb, int type, void __user *addr)
 
 static void copy_to_if_dqblk(struct if_dqblk *dst, struct fs_disk_quota *src)
 {
+	memset(dst, 0, sizeof(*dst));
 	dst->dqb_bhardlimit = src->d_blk_hardlimit;
 	dst->dqb_bsoftlimit = src->d_blk_softlimit;
 	dst->dqb_curspace = src->d_bcount;
