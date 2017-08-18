From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 19:06:34 +0000
Subject: [PATCH 1/3] jffs2: Delete an error message for a failed memory allocation in four functions
Message-Id: <1ebc1611-6181-f7ab-f8e9-747944f5f819@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
In-Reply-To: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 20:06:44 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jffs2/compr.c | 5 ++---
 fs/jffs2/dir.c   | 1 -
 fs/jffs2/erase.c | 5 +----
 fs/jffs2/gc.c    | 5 ++---
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 4849a4c9a0e2..96d19ef95b11 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -80,10 +80,9 @@ static int jffs2_selected_compress(u8 compr, unsigned char *data_in,
 	char *output_buf;
 
 	output_buf = kmalloc(*cdatalen, GFP_KERNEL);
-	if (!output_buf) {
-		pr_warn("No memory for compressor allocation. Compression failed.\n");
+	if (!output_buf)
 		return ret;
-	}
+
 	orig_slen = *datalen;
 	orig_dlen = *cdatalen;
 	spin_lock(&jffs2_compressor_list_lock);
diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 0a754f38462e..0b126df5ecc6 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -350,7 +350,6 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	/* We use f->target field to store the target path. */
 	f->target = kmemdup(target, targetlen + 1, GFP_KERNEL);
 	if (!f->target) {
-		pr_warn("Can't allocate %d bytes of memory\n", targetlen + 1);
 		mutex_unlock(&f->sem);
 		jffs2_complete_reservation(c);
 		ret = -ENOMEM;
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 4a6cf289be24..d944748524ad 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -380,8 +380,5 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
-	if (!ebuf) {
-		pr_warn("Failed to allocate page buffer for verifying erase at 0x%08x. Refiling\n",
-			jeb->offset);
+	if (!ebuf)
 		return -EAGAIN;
-	}
 
 	jffs2_dbg(1, "Verifying erase at 0x%08x\n", jeb->offset);
 
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 9ed0f26cf023..9e49392458e3 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -780,7 +780,6 @@ static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_
-		if (!mdata) {
-			pr_warn("kmalloc of mdata failed in jffs2_garbage_collect_metadata()\n");
+		if (!mdata)
 			return -ENOMEM;
-		}
+
 		ret = jffs2_read_dnode(c, f, fn, mdata, 0, mdatalen);
 		if (ret) {
 			pr_warn("read of old metadata failed in jffs2_garbage_collect_metadata(): %d\n",
-- 
2.14.0

