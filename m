From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Apr 2019 09:01:57 +0000
Subject: [PATCH v2] media: omap_vout: potential buffer overflow in vidioc_dqbuf()
Message-Id: <20190411090157.GA27624@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <eb4fe291-85b5-540b-c210-5e9fb051f2cc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "b->index" is a u32 the comes from the user in the ioctl.  It hasn't
been checked.  We aren't supposed to use it but we're instead supposed
to use the value that gets written to it when we call videobuf_dqbuf().

The videobuf_dqbuf() first memsets it to zero and then re-initializes it
inside the videobuf_status() function.  It's this final value which we
want.

Hans Verkuil pointed out that we need to check the return from
videobuf_dqbuf().  I ended up doing a little cleanup related to that as
well.

Fixes: 72915e851da9 ("[media] V4L2: OMAP: VOUT: dma map and unmap v4l2 buffers in qbuf and dqbuf")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: check videobuf_dqbuf() return

 drivers/media/platform/omap/omap_vout.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index 37f0d7146dfa..cb6a9e3946b6 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -1527,23 +1527,20 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 	unsigned long size;
 	struct videobuf_buffer *vb;
 
-	vb = q->bufs[b->index];
-
 	if (!vout->streaming)
 		return -EINVAL;
 
-	if (file->f_flags & O_NONBLOCK)
-		/* Call videobuf_dqbuf for non blocking mode */
-		ret = videobuf_dqbuf(q, (struct v4l2_buffer *)b, 1);
-	else
-		/* Call videobuf_dqbuf for  blocking mode */
-		ret = videobuf_dqbuf(q, (struct v4l2_buffer *)b, 0);
+	ret = videobuf_dqbuf(q, b, !!(file->f_flags & O_NONBLOCK));
+	if (ret)
+		return ret;
+
+	vb = q->bufs[b->index];
 
 	addr = (unsigned long) vout->buf_phy_addr[vb->i];
 	size = (unsigned long) vb->size;
 	dma_unmap_single(vout->vid_dev->v4l2_dev.dev,  addr,
 				size, DMA_TO_DEVICE);
-	return ret;
+	return 0;
 }
 
 static int vidioc_streamon(struct file *file, void *fh, enum v4l2_buf_type i)
-- 
2.17.1
