From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Feb 2019 18:06:42 +0000
Subject: [PATCH][media-next] media: vb2: remove unused variable i
Message-Id: <20190201180642.14328-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable i is declared and never used. Fix this by removing it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index e07b6bdb6982..34cc87ca8d59 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1769,7 +1769,6 @@ EXPORT_SYMBOL_GPL(vb2_wait_for_all_buffers);
 static void __vb2_dqbuf(struct vb2_buffer *vb)
 {
 	struct vb2_queue *q = vb->vb2_queue;
-	unsigned int i;
 
 	/* nothing to do if the buffer is already dequeued */
 	if (vb->state = VB2_BUF_STATE_DEQUEUED)
-- 
2.20.1
