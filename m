From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Jan 2012 08:53:17 +0000
Subject: [patch] HPFS: remove PRINTK() macro
Message-Id: <20120131085313.GC22039@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The PRINTK() macro isn't really used.  Let's just remove it because it
is ugly and out of date.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/hpfs/buffer.c b/fs/hpfs/buffer.c
index 9ecde27..f49d149 100644
--- a/fs/hpfs/buffer.c
+++ b/fs/hpfs/buffer.c
@@ -156,7 +156,6 @@ void hpfs_brelse4(struct quad_buffer_head *qbh)
 
 void hpfs_mark_4buffers_dirty(struct quad_buffer_head *qbh)
 {
-	PRINTK(("hpfs_mark_4buffers_dirty\n"));
 	memcpy(qbh->bh[0]->b_data, qbh->data, 512);
 	memcpy(qbh->bh[1]->b_data, qbh->data + 512, 512);
 	memcpy(qbh->bh[2]->b_data, qbh->data + 2 * 512, 512);
diff --git a/fs/hpfs/hpfs_fn.h b/fs/hpfs/hpfs_fn.h
index de94617..6d2d500 100644
--- a/fs/hpfs/hpfs_fn.h
+++ b/fs/hpfs/hpfs_fn.h
@@ -35,13 +35,6 @@
 
 #define CHKCOND(x,y) if (!(x)) printk y
 
-#ifdef DBG
-#define PRINTK(x) printk x
-#else
-#undef PRINTK
-#define PRINTK(x)
-#endif
-
 struct hpfs_inode_info {
 	loff_t mmu_private;
 	ino_t i_parent_dir;	/* (directories) gives fnode of parent dir */
