From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 26 Jan 2013 07:48:42 +0000
Subject: [patch] eCryptfs: remove unneeded checks in virt_to_scatterlist()
Message-Id: <20130126074842.GA14365@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is always called with a valid "sg" pointer.  My static checker
complains because the call to sg_init_table() dereferences "sg" before
we reach the checks.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index a7b0c2d..d5c25db 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -301,17 +301,14 @@ int virt_to_scatterlist(const void *addr, int size, struct scatterlist *sg,
 	while (size > 0 && i < sg_size) {
 		pg = virt_to_page(addr);
 		offset = offset_in_page(addr);
-		if (sg)
-			sg_set_page(&sg[i], pg, 0, offset);
+		sg_set_page(&sg[i], pg, 0, offset);
 		remainder_of_page = PAGE_CACHE_SIZE - offset;
 		if (size >= remainder_of_page) {
-			if (sg)
-				sg[i].length = remainder_of_page;
+			sg[i].length = remainder_of_page;
 			addr += remainder_of_page;
 			size -= remainder_of_page;
 		} else {
-			if (sg)
-				sg[i].length = size;
+			sg[i].length = size;
 			addr += size;
 			size = 0;
 		}
