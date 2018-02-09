From: jiangyiwen <jiangyiwen@huawei.com>
Date: Fri, 09 Feb 2018 06:13:28 +0000
Subject: [V9fs-developer] [PATCH] fs/9p: don't set SB_NOATIME by default
Message-Id: <5A7D3C08.7020309@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v9fs-developer@lists.sourceforge.net
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

User use some syscall, for example mmap(v9fs_file_mmap), it will not
update atime even if user's mnt_flags have MNT_NOATIME, because
v9fs default set SB_NOATIME in v9fs_set_super.

For supporting access time is updated when user mount with relatime,
we should clear SB_NOATIME by default.

Signed-off-by: Yiwen Jiang <jiangyiwen@huawei.com>
---
 fs/9p/vfs_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index af03c2a..48ce504 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -94,7 +94,7 @@ static int v9fs_set_super(struct super_block *s, void *data)
 	if (v9ses->cache)
 		sb->s_bdi->ra_pages = (VM_MAX_READAHEAD * 1024)/PAGE_SIZE;

-	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC | SB_NOATIME;
+	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC;
 	if (!v9ses->cache)
 		sb->s_flags |= SB_SYNCHRONOUS;

-- 
1.8.3.1

