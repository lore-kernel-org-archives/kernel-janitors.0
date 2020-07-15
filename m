From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Jul 2020 17:03:55 +0000
Subject: [PATCH] fs/ufs: avoid potential u32 multiplication overflow
Message-Id: <20200715170355.1081713-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Dushistov <dushistov@mail.ru>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The 64 bit ino is being compared to the product of two u32
values, however, the multiplication is being performed using
a 32 bit multiply so there is a potential of an overflow. To
be fully safe, cast uspi->s_ncg to a u64 to ensure a 64 bit
multiplication occurs to avoid any chance of overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: f3e2a520f5fb ("ufs: NFS support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ufs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 1da0be667409..e3b69fb280e8 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -101,7 +101,7 @@ static struct inode *ufs_nfs_get_inode(struct super_block *sb, u64 ino, u32 gene
 	struct ufs_sb_private_info *uspi = UFS_SB(sb)->s_uspi;
 	struct inode *inode;
 
-	if (ino < UFS_ROOTINO || ino > uspi->s_ncg * uspi->s_ipg)
+	if (ino < UFS_ROOTINO || ino > (u64)uspi->s_ncg * uspi->s_ipg)
 		return ERR_PTR(-ESTALE);
 
 	inode = ufs_iget(sb, ino);
-- 
2.27.0
