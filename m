From: Cyril Roelandt <tipecaml@gmail.com>
Date: Mon, 19 Nov 2012 21:36:09 +0000
Subject: [PATCH] mx2_camera: use GFP_ATOMIC under spin lock.
Message-Id: <1353360969-18515-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, mchehab@infradead.org, g.liakhovetski@gmx.de, kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

Found using the following semantic patch:

<spml>
@@
@@
spin_lock_irqsave(...);
... when != spin_unlock_irqrestore(...);
* GFP_KERNEL
</spml>

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/media/platform/soc_camera/mx2_camera.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/soc_camera/mx2_camera.c b/drivers/media/platform/soc_camera/mx2_camera.c
index e575ae8..516b3a3 100644
--- a/drivers/media/platform/soc_camera/mx2_camera.c
+++ b/drivers/media/platform/soc_camera/mx2_camera.c
@@ -909,7 +909,7 @@ static int mx2_start_streaming(struct vb2_queue *q, unsigned int count)
 		pcdev->discard_size = icd->user_height * bytesperline;
 		pcdev->discard_buffer = dma_alloc_coherent(ici->v4l2_dev.dev,
 				pcdev->discard_size, &pcdev->discard_buffer_dma,
-				GFP_KERNEL);
+				GFP_ATOMIC);
 		if (!pcdev->discard_buffer)
 			return -ENOMEM;
 
-- 
1.7.10.4

