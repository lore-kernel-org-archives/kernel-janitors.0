From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Mar 2016 11:40:02 +0000
Subject: [patch] ufs: silence uninitialized warnings
Message-Id: <20160322114001.GB4519@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Dushistov <dushistov@mail.ru>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that we can use "tmp" without initializing it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ufs/util.h b/fs/ufs/util.h
index 9541759..8aa8812 100644
--- a/fs/ufs/util.h
+++ b/fs/ufs/util.h
@@ -88,7 +88,7 @@ ufs_get_fs_npsect(struct super_block *sb, struct ufs_super_block_first *usb1,
 static inline u64
 ufs_get_fs_qbmask(struct super_block *sb, struct ufs_super_block_third *usb3)
 {
-	__fs64 tmp;
+	__fs64 tmp = 0;
 
 	switch (UFS_SB(sb)->s_flags & UFS_ST_MASK) {
 	case UFS_ST_SUNOS:
@@ -112,7 +112,7 @@ ufs_get_fs_qbmask(struct super_block *sb, struct ufs_super_block_third *usb3)
 static inline u64
 ufs_get_fs_qfmask(struct super_block *sb, struct ufs_super_block_third *usb3)
 {
-	__fs64 tmp;
+	__fs64 tmp = 0;
 
 	switch (UFS_SB(sb)->s_flags & UFS_ST_MASK) {
 	case UFS_ST_SUNOS:
