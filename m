From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 20 Jan 2020 08:54:11 +0000
Subject: [PATCH -next] watch_queue: Fix error return code in watch_queue_set_size()
Message-Id: <20200120085411.116252-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: d9a34f010efd ("pipe: Add general notification queue support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 kernel/watch_queue.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index f195cbbbb3d3..3051cf4e35c6 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -252,21 +252,27 @@ long watch_queue_set_size(struct pipe_inode_info *pipe, unsigned int nr_notes)
 		goto error;
 
 	pages = kcalloc(sizeof(struct page *), nr_pages, GFP_KERNEL);
-	if (!pages)
+	if (!pages) {
+		ret = -ENOMEM;
 		goto error;
+	}
 
 	for (i = 0; i < nr_pages; i++) {
 		pages[i] = alloc_page(GFP_KERNEL);
-		if (!pages[i])
+		if (!pages[i]) {
+			ret = -ENOMEM;
 			goto error_p;
+		}
 		pages[i]->index = i * WATCH_QUEUE_NOTES_PER_PAGE;
 	}
 
 	bmsize = (nr_notes + BITS_PER_LONG - 1) / BITS_PER_LONG;
 	bmsize *= sizeof(unsigned long);
 	bitmap = kmalloc(bmsize, GFP_KERNEL);
-	if (!bitmap)
+	if (!bitmap) {
+		ret = -ENOMEM;
 		goto error_p;
+	}
 
 	memset(bitmap, 0xff, bmsize);
 	wqueue->notes = pages;
