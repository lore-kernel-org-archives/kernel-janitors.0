From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 18:02:28 +0000
Subject: [KJ] [PATCH] ivtv: Remove unnecessary cast of return value of
Message-Id: <4684450C020000F40000A9C9@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc()/kzalloc() in ivtv.

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/media/video/ivtv/ivtv-queue.c b/drivers/media/video/ivtv/ivtv-queue.c
index a04f938..45825b8 100644
--- a/drivers/media/video/ivtv/ivtv-queue.c
+++ b/drivers/media/video/ivtv/ivtv-queue.c
@@ -196,7 +196,7 @@ int ivtv_stream_alloc(struct ivtv_stream *s)
 		s->name, s->buffers, s->buf_size, s->buffers * s->buf_size / 1024);
 
 	if (ivtv_might_use_pio(s)) {
-		s->PIOarray = (struct ivtv_SG_element *)kzalloc(SGsize, GFP_KERNEL);
+		s->PIOarray = kzalloc(SGsize, GFP_KERNEL);
 		if (s->PIOarray = NULL) {
 			IVTV_ERR("Could not allocate PIOarray for %s stream\n", s->name);
 			return -ENOMEM;
@@ -204,7 +204,7 @@ int ivtv_stream_alloc(struct ivtv_stream *s)
 	}
 
 	/* Allocate DMA SG Arrays */
-	s->SGarray = (struct ivtv_SG_element *)kzalloc(SGsize, GFP_KERNEL);
+	s->SGarray = kzalloc(SGsize, GFP_KERNEL);
 	if (s->SGarray = NULL) {
 		IVTV_ERR("Could not allocate SGarray for %s stream\n", s->name);
 		if (ivtv_might_use_pio(s)) {
diff --git a/drivers/media/video/zoran_driver.c b/drivers/media/video/zoran_driver.c
index cf0ed6c..76ba51e 100644
--- a/drivers/media/video/zoran_driver.c
+++ b/drivers/media/video/zoran_driver.c
@@ -568,10 +568,7 @@ jpg_fbuffer_alloc (struct file *file)
 
 		//if (alloc_contig) {
 		if (fh->jpg_buffers.need_contiguous) {
-			mem -			    (unsigned long) kmalloc(fh->jpg_buffers.
-						    buffer_size,
-						    GFP_KERNEL);
+			mem = kmalloc(fh->jpg_buffers.buffer_size, GFP_KERNEL);
 			if (mem = 0) {
 				dprintk(1,
 					KERN_ERR

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
