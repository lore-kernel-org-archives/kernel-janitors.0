From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 17:54:25 +0000
Subject: [PATCH 1/7] fs/affs/file.c: Use BUG_ON
Message-Id: <Pine.LNX.4.64.0802171853380.28055@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zippel@linux-m68k.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
side-effects to allow a definition of BUG_ON that drops the code completely.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ disable unlikely @ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (unlikely(E)) { BUG(); }
+ BUG_ON(E);
)

@@ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/fs/affs/file.c b/fs/affs/file.c
--- a/fs/affs/file.c 2007-10-22 11:25:28.000000000 +0200
+++ b/fs/affs/file.c 2008-02-17 16:39:18.000000000 +0100
@@ -325,8 +325,7 @@ affs_get_block(struct inode *inode, sect
 	pr_debug("AFFS: get_block(%u, %lu)\n", (u32)inode->i_ino, (unsigned long)block);
 
 
-	if (block > (sector_t)0x7fffffffUL)
-		BUG();
+	BUG_ON(block > (sector_t)0x7fffffffUL);
 
 	if (block >= AFFS_I(inode)->i_blkcnt) {
 		if (block > AFFS_I(inode)->i_blkcnt || !create)
@@ -493,8 +492,7 @@ affs_do_readpage_ofs(struct file *file, 
 	u32 tmp;
 
 	pr_debug("AFFS: read_page(%u, %ld, %d, %d)\n", (u32)inode->i_ino, page->index, from, to);
-	if (from > to || to > PAGE_CACHE_SIZE)
-		BUG();
+	BUG_ON(from > to || to > PAGE_CACHE_SIZE);
 	kmap(page);
 	data = page_address(page);
 	bsize = AFFS_SB(sb)->s_data_blksize;
@@ -507,8 +505,7 @@ affs_do_readpage_ofs(struct file *file, 
 		if (IS_ERR(bh))
 			return PTR_ERR(bh);
 		tmp = min(bsize - boff, to - from);
-		if (from + tmp > to || tmp > bsize)
-			BUG();
+		BUG_ON(from + tmp > to || tmp > bsize);
 		memcpy(data + from, AFFS_DATA(bh) + boff, tmp);
 		affs_brelse(bh);
 		bidx++;
@@ -540,8 +537,7 @@ affs_extent_file_ofs(struct inode *inode
 		if (IS_ERR(bh))
 			return PTR_ERR(bh);
 		tmp = min(bsize - boff, newsize - size);
-		if (boff + tmp > bsize || tmp > bsize)
-			BUG();
+		BUG_ON(boff + tmp > bsize || tmp > bsize);
 		memset(AFFS_DATA(bh) + boff, 0, tmp);
 		AFFS_DATA_HEAD(bh)->size = cpu_to_be32(be32_to_cpu(AFFS_DATA_HEAD(bh)->size) + tmp);
 		affs_fix_checksum(sb, bh);
@@ -560,8 +556,7 @@ affs_extent_file_ofs(struct inode *inode
 		if (IS_ERR(bh))
 			goto out;
 		tmp = min(bsize, newsize - size);
-		if (tmp > bsize)
-			BUG();
+		BUG_ON(tmp > bsize);
 		AFFS_DATA_HEAD(bh)->ptype = cpu_to_be32(T_DATA);
 		AFFS_DATA_HEAD(bh)->key = cpu_to_be32(inode->i_ino);
 		AFFS_DATA_HEAD(bh)->sequence = cpu_to_be32(bidx);
@@ -683,8 +678,7 @@ static int affs_write_end_ofs(struct fil
 		if (IS_ERR(bh))
 			return PTR_ERR(bh);
 		tmp = min(bsize - boff, to - from);
-		if (boff + tmp > bsize || tmp > bsize)
-			BUG();
+		BUG_ON(boff + tmp > bsize || tmp > bsize);
 		memcpy(AFFS_DATA(bh) + boff, data + from, tmp);
 		AFFS_DATA_HEAD(bh)->size = cpu_to_be32(be32_to_cpu(AFFS_DATA_HEAD(bh)->size) + tmp);
 		affs_fix_checksum(sb, bh);
@@ -732,8 +726,7 @@ static int affs_write_end_ofs(struct fil
 		if (IS_ERR(bh))
 			goto out;
 		tmp = min(bsize, to - from);
-		if (tmp > bsize)
-			BUG();
+		BUG_ON(tmp > bsize);
 		memcpy(AFFS_DATA(bh), data + from, tmp);
 		if (buffer_new(bh)) {
 			AFFS_DATA_HEAD(bh)->ptype = cpu_to_be32(T_DATA);
