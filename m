From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 09:02:56 +0000
Subject: [PATCH] statfs: remove redundant pointer sb
Message-Id: <20180717090256.18162-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer sb is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'sb' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/statfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/statfs.c b/fs/statfs.c
index 3b8e27003754..82384616e524 100644
--- a/fs/statfs.c
+++ b/fs/statfs.c
@@ -402,7 +402,6 @@ COMPAT_SYSCALL_DEFINE2(ustat, unsigned, dev, struct compat_ustat __user *, u)
 static int fsinfo_generic_statfs(struct dentry *dentry,
 				 struct fsinfo_statfs *p)
 {
-	struct super_block *sb;
 	struct kstatfs buf;
 	int ret;
 
@@ -410,7 +409,6 @@ static int fsinfo_generic_statfs(struct dentry *dentry,
 	if (ret < 0)
 		return ret;
 
-	sb = dentry->d_sb;
 	p->f_blocks	= buf.f_blocks;
 	p->f_bfree	= buf.f_bfree;
 	p->f_bavail	= buf.f_bavail;
-- 
2.17.1

