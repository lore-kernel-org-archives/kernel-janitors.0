From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:10 +0000
Subject: [KJ] [Patch 2/8] BUG_ON() Conversion in fs/buffer.c
Message-Id: <1138296010.9170.21.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99352951185618443=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99352951185618443==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/buffer.c.orig	2006-01-26 17:52:56.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/buffer.c	2006-01-26 17:54:08.000000000 +0100
@@ -801,8 +801,7 @@ void mark_buffer_dirty_inode(struct buff
 	if (!mapping->assoc_mapping) {
 		mapping->assoc_mapping = buffer_mapping;
 	} else {
-		if (mapping->assoc_mapping != buffer_mapping)
-			BUG();
+		BUG_ON(mapping->assoc_mapping != buffer_mapping);
 	}
 	if (list_empty(&bh->b_assoc_buffers)) {
 		spin_lock(&buffer_mapping->private_lock);
@@ -1118,8 +1117,7 @@ grow_dev_page(struct block_device *bdev,
 	if (!page)
 		return NULL;
 
-	if (!PageLocked(page))
-		BUG();
+	BUG_ON(!PageLocked(page));
 
 	if (page_has_buffers(page)) {
 		bh = page_buffers(page);
@@ -1526,8 +1524,7 @@ void set_bh_page(struct buffer_head *bh,
 		struct page *page, unsigned long offset)
 {
 	bh->b_page = page;
-	if (offset >= PAGE_SIZE)
-		BUG();
+	BUG_ON(offset >= PAGE_SIZE);
 	if (PageHighMem(page))
 		/*
 		 * This catches illegal uses and preserves the offset:



--===============99352951185618443==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99352951185618443==--
