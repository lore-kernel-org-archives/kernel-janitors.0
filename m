From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 08 Aug 2018 04:35:42 +0000
Subject: [PATCH -next] statfs: remove set but not used variable 'sb'
Message-Id: <1533702942-166827-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/statfs.c: In function 'fsinfo_generic_statfs':
fs/statfs.c:406:22: warning:
 variable 'sb' set but not used [-Wunused-but-set-variable]
  struct super_block *sb;
                      ^

Fixes: 90b413cb970a ("vfs: syscall: Add fsinfo() to query filesystem information")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/statfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/statfs.c b/fs/statfs.c
index 2f3f2d5..f714f05 100644
--- a/fs/statfs.c
+++ b/fs/statfs.c
@@ -403,7 +403,6 @@ int kcompat_sys_fstatfs64(unsigned int fd, compat_size_t sz, struct compat_statf
 static int fsinfo_generic_statfs(struct dentry *dentry,
 				 struct fsinfo_statfs *p)
 {
-	struct super_block *sb;
 	struct kstatfs buf;
 	int ret;
 
@@ -411,7 +410,6 @@ static int fsinfo_generic_statfs(struct dentry *dentry,
 	if (ret < 0)
 		return ret;
 
-	sb = dentry->d_sb;
 	p->f_blocks	= buf.f_blocks;
 	p->f_bfree	= buf.f_bfree;
 	p->f_bavail	= buf.f_bavail;

