From: Julia Lawall <julia@diku.dk>
Date: Sun, 12 Jul 2009 07:43:21 +0000
Subject: [PATCH 2/3] drivers/staging/b3dfg: Drop NULL test on list_entry
Message-Id: <Pine.LNX.4.64.0907120942480.17416@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, devel@driverdev.osuosl.org, jirislaby@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

list_entry, which is an alias for container_of, cannot return NULL, as
there is no way to add a NULL value to a doubly linked list.

A simplified version of the semantic match that findds this problem is as
follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
expression x,E;
statement S1,S2;
position p,p1;
@@

*x = list_entry@p(...)
... when != x = E
*if@p1 (x = NULL) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/b3dfg/b3dfg.c       |   41 ++++++++-----------
 1 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/b3dfg/b3dfg.c b/drivers/staging/b3dfg/b3dfg.c
index eec9c99..94c5d27 100644
--- a/drivers/staging/b3dfg/b3dfg.c
+++ b/drivers/staging/b3dfg/b3dfg.c
@@ -632,18 +632,15 @@ static void transfer_complete(struct b3dfg_dev *fgdev)
 	fgdev->cur_dma_frame_addr = 0;
 
 	buf = list_entry(fgdev->buffer_queue.next, struct b3dfg_buffer, list);
-	if (buf) {
-		dev_dbg(dev, "handle frame completion\n");
-		if (fgdev->cur_dma_frame_idx = B3DFG_FRAMES_PER_BUFFER - 1) {
-
-			/* last frame of that triplet completed */
-			dev_dbg(dev, "triplet completed\n");
-			buf->state = B3DFG_BUFFER_POPULATED;
-			list_del_init(&buf->list);
-			wake_up_interruptible(&fgdev->buffer_waitqueue);
-		}
-	} else {
-		dev_err(dev, "got frame but no buffer!\n");
+
+	dev_dbg(dev, "handle frame completion\n");
+	if (fgdev->cur_dma_frame_idx = B3DFG_FRAMES_PER_BUFFER - 1) {
+
+		/* last frame of that triplet completed */
+		dev_dbg(dev, "triplet completed\n");
+		buf->state = B3DFG_BUFFER_POPULATED;
+		list_del_init(&buf->list);
+		wake_up_interruptible(&fgdev->buffer_waitqueue);
 	}
 }
 
@@ -663,19 +660,15 @@ static bool setup_next_frame_transfer(struct b3dfg_dev *fgdev, int idx)
 	dev_dbg(dev, "program DMA transfer for next frame: %d\n", idx);
 
 	buf = list_entry(fgdev->buffer_queue.next, struct b3dfg_buffer, list);
-	if (buf) {
-		if (idx = fgdev->cur_dma_frame_idx + 2) {
-			if (setup_frame_transfer(fgdev, buf, idx - 1))
-				dev_err(dev, "unable to map DMA buffer\n");
-			need_ack = 0;
-		} else {
-			dev_err(dev, "frame mismatch, got %d, expected %d\n",
-				idx, fgdev->cur_dma_frame_idx + 2);
-
-			/* FIXME: handle dropped triplets here */
-		}
+	if (idx = fgdev->cur_dma_frame_idx + 2) {
+		if (setup_frame_transfer(fgdev, buf, idx - 1))
+			dev_err(dev, "unable to map DMA buffer\n");
+		need_ack = 0;
 	} else {
-		dev_err(dev, "cannot setup DMA, no buffer\n");
+		dev_err(dev, "frame mismatch, got %d, expected %d\n",
+			idx, fgdev->cur_dma_frame_idx + 2);
+
+		/* FIXME: handle dropped triplets here */
 	}
 
 	return need_ack;
