From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 06 Jun 2010 01:41:00 +0000
Subject: [PATCH] drivers/staging/pohmelfs: fix compile warning
Message-Id: <1275788460.10961.18.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

A really trivial patch to solve a warning when compiling staging/pohmelfs

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/pohmelfs/inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/pohmelfs/inode.c b/drivers/staging/pohmelfs/inode.c
index 643b413..20b0c68 100644
--- a/drivers/staging/pohmelfs/inode.c
+++ b/drivers/staging/pohmelfs/inode.c
@@ -1266,7 +1266,7 @@ static void pohmelfs_put_super(struct super_block *sb)
 {
 	struct pohmelfs_sb *psb = POHMELFS_SB(sb);
 	struct pohmelfs_inode *pi;
-	unsigned int count;
+	unsigned int count = 0;
 	unsigned int in_drop_list = 0;
 	struct inode *inode, *tmp;
 
-- 
1.7.0.4



