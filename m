From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 18:54:23 +0000
Subject: [patch] V4L/DVB: tm6000: remove unneeded NULL check
Message-Id: <20100810185423.GH18431@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We're testing the wrong variable here, and anyway list_entry() never
returns NULL.  We already verified that the list is not empty.

This was added by: 721f507b694f "V4L/DVB (12842): tm6000: avoid kernel
panic while retrieving the filling buffer"

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
It could be that this is really trying to check if it's the last item in
the list?  In that case the fix is more complicated.

diff --git a/drivers/staging/tm6000/tm6000-video.c b/drivers/staging/tm6000/tm6000-video.c
index ce0a089..cbd89ad 100644
--- a/drivers/staging/tm6000/tm6000-video.c
+++ b/drivers/staging/tm6000/tm6000-video.c
@@ -145,9 +145,6 @@ static inline void get_next_buf(struct tm6000_dmaqueue *dma_q,
 	*buf = list_entry(dma_q->active.next,
 			struct tm6000_buffer, vb.queue);
 
-	if (!buf)
-		return;
-
 	/* Cleans up buffer - Usefull for testing for frame/URB loss */
 	outp = videobuf_to_vmalloc(&(*buf)->vb);
 
