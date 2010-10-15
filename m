From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 03:44:58 +0000
Subject: [patch 2/2] Staging: intel_sst: cleanup naming a little
Message-Id: <20101015034458.GJ6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

&sst_drv_ctx->streams[str_id].lock and &stream->lock are the same.
The mutex_lock() uses &stream->lock so this makes things consistent and
it's nicer to read as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index baf0ddc..086999b 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -1060,20 +1062,18 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 				retval = sst_capture_frame(str_id);
 			else {
 				retval = -EINVAL;
-				mutex_unlock(
-					&sst_drv_ctx->streams[str_id].lock);
+				mutex_unlock(&stream->lock);
 				break;
 			}
 			if (retval < 0) {
 				stream->status = STREAM_INIT;
-				mutex_unlock(
-					&sst_drv_ctx->streams[str_id].lock);
+				mutex_unlock(&stream->lock);
 				break;
 			}
 		} else {
 			retval = -EINVAL;
 		}
-		mutex_unlock(&sst_drv_ctx->streams[str_id].lock);
+		mutex_unlock(&stream->lock);
 		break;
 	}
 
