From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 13:10:50 +0000
Subject: [PATCH] Drivers: V4L2: Clean up unused variable 'fileio' in vb2_thread_stop()
Message-Id: <1429708250-23243-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Firo Yang <firogm@gmail.com>

Local variable struct vb2_fileio_data *fileio was not used
in this function. So just remove it.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/media/v4l2-core/videobuf2-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/videobuf2-core.c b/drivers/media/v4l2-core/videobuf2-core.c
index cc16e76..471b171 100644
--- a/drivers/media/v4l2-core/videobuf2-core.c
+++ b/drivers/media/v4l2-core/videobuf2-core.c
@@ -3225,7 +3225,6 @@ EXPORT_SYMBOL_GPL(vb2_thread_start);
 int vb2_thread_stop(struct vb2_queue *q)
 {
 	struct vb2_threadio_data *threadio = q->threadio;
-	struct vb2_fileio_data *fileio = q->fileio;
 	int err;
 
 	if (threadio = NULL)
-- 
2.1.0

