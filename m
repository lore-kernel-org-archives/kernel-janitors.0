From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 04 May 2019 10:25:06 +0000
Subject: [PATCH -next] ntfs: remove set but not used variable 'attr_len'
Message-Id: <20190504102506.99020-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <anton@tuxera.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/ntfs/inode.c: In function 'ntfs_truncate':
fs/ntfs/inode.c:2357:6: warning:
 variable 'attr_len' set but not used [-Wunused-but-set-variable]

It is never use since introduction in
commit dd072330d1a6 ("NTFS: Implement fs/ntfs/inode.[hc]::ntfs_truncate().
It only supports       uncompressed and unencrypted files.")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/ntfs/inode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index fb1a2b49a5da..1c8b669e7a52 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2354,7 +2354,6 @@ int ntfs_truncate(struct inode *vi)
 	ATTR_RECORD *a;
 	const char *te = "  Leaving file length out of sync with i_size.";
 	int err, mp_size, size_change, alloc_change;
-	u32 attr_len;
 
 	ntfs_debug("Entering for inode 0x%lx.", vi->i_ino);
 	BUG_ON(NInoAttr(ni));
@@ -2728,7 +2727,6 @@ int ntfs_truncate(struct inode *vi)
 	 * this cannot fail since we are making the attribute smaller thus by
 	 * definition there is enough space to do so.
 	 */
-	attr_len = le32_to_cpu(a->length);
 	err = ntfs_attr_record_resize(m, a, mp_size +
 			le16_to_cpu(a->data.non_resident.mapping_pairs_offset));
 	BUG_ON(err);
