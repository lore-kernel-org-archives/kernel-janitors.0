From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:13:16 +0000
Subject: [PATCH 2/37] drivers/memstick/core/mspro_block.c: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152312290.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/memstick/core/mspro_block.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1012,12 +1012,11 @@ static int mspro_block_read_attributes(s
 	}
 	msb->attr_group.name = "media_attributes";
 
-	buffer = kmalloc(msb->page_size, GFP_KERNEL);
+	buffer = kmemdup((char *)attr, msb->page_size, GFP_KERNEL);
 	if (!buffer) {
 		rc = -ENOMEM;
 		goto out_free_attr;
 	}
-	memcpy(buffer, (char *)attr, msb->page_size);
 	page_count = 1;
 
 	for (cnt = 0; cnt < attr_count; ++cnt) {
