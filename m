From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 13:36:33 +0000
Subject: [PATCH 2/3] jfs: Improve size determinations in five functions
Message-Id: <8ac16f00-0995-86b6-7495-f8f7028f2138@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
In-Reply-To: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, Fabian Frederick <fabf@skynet.be>, Jan Kara <jack@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 14:54:11 +0200

* Replace the specification of data structures by pointer dereferences
  as the parameter for the operator "sizeof" to make the corresponding size
  determination a bit safer according to the Linux coding style convention.

  This issue was detected by using the Coccinelle software.

* The script "checkpatch.pl" pointed information out like the following.

  ERROR: do not use assignment in if condition

  Thus fix two affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jfs/jfs_imap.c     | 2 +-
 fs/jfs/jfs_logmgr.c   | 8 +++++---
 fs/jfs/jfs_metapage.c | 2 +-
 fs/jfs/super.c        | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index da8051299e47..a7e3a61187db 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -115,5 +115,5 @@ int diMount(struct inode *ipimap)
 	 * allocate/initialize the in-memory inode map control structure
 	 */
 	/* allocate the in-memory inode map control structure. */
-	imap = kmalloc(sizeof(struct inomap), GFP_KERNEL);
+	imap = kmalloc(sizeof(*imap), GFP_KERNEL);
 	if (!imap)
diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index a21f0e9eecd4..ed103c44bd52 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1109,7 +1109,8 @@ int lmLogOpen(struct super_block *sb)
 		}
 	}
 
-	if (!(log = kzalloc(sizeof(struct jfs_log), GFP_KERNEL))) {
+	log = kzalloc(sizeof(*log), GFP_KERNEL);
+	if (!log) {
 		mutex_unlock(&jfs_log_mutex);
 		return -ENOMEM;
 	}
@@ -1178,7 +1179,8 @@ static int open_inline_log(struct super_block *sb)
 	struct jfs_log *log;
 	int rc;
 
-	if (!(log = kzalloc(sizeof(struct jfs_log), GFP_KERNEL)))
+	log = kzalloc(sizeof(*log), GFP_KERNEL);
+	if (!log)
 		return -ENOMEM;
 	INIT_LIST_HEAD(&log->sb_list);
 	init_waitqueue_head(&log->syncwait);
@@ -1839,7 +1841,7 @@ static int lbmLogInit(struct jfs_log * log)
 			goto error;
 		buffer = page_address(page);
 		for (offset = 0; offset < PAGE_SIZE; offset += LOGPSIZE) {
-			lbuf = kmalloc(sizeof(struct lbuf), GFP_KERNEL);
+			lbuf = kmalloc(sizeof(*lbuf), GFP_KERNEL);
 			if (lbuf = NULL) {
 				if (offset = 0)
 					__free_page(page);
diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 65120a471729..6c75a7c87c0c 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -107,7 +107,7 @@ static inline int insert_metapage(struct page *page, struct metapage *mp)
 	if (PagePrivate(page))
 		a = mp_anchor(page);
 	else {
-		a = kzalloc(sizeof(struct meta_anchor), GFP_NOFS);
+		a = kzalloc(sizeof(*a), GFP_NOFS);
 		if (!a)
 			return -ENOMEM;
 		set_page_private(page, (unsigned long)a);
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 78b41e1d5c67..381476422e8d 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -526,7 +526,7 @@ static int jfs_fill_super(struct super_block *sb, void *data, int silent)
 
 	jfs_info("In jfs_read_super: s_flags=0x%lx", sb->s_flags);
 
-	sbi = kzalloc(sizeof(struct jfs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 
-- 
2.14.0

