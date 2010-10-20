From: Dan Carpenter <error27@gmail.com>
Date: Wed, 20 Oct 2010 06:57:34 +0000
Subject: [patch 1/2] Staging: sst: user pointers in
Message-Id: <20101020065734.GA5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were some places in intel_sst_mmap_play_capture() that
dereferenced user pointers instead of copying the data to the kernel.

I removed the BUG_ON(!mmap_buf) and BUG_ON(!buf_entry) since those are
never possible in the current code.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
These apply on top of the three I sent yesterday.

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index d20724d..0592eb3 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -244,12 +244,12 @@ static int intel_sst_mmap_play_capture(u32 str_id,
 	int retval, i;
 	struct stream_info *stream;
 	struct snd_sst_mmap_buff_entry *buf_entry;
+	struct snd_sst_mmap_buff_entry *tmp_buf;
 
 	pr_debug("sst:called for str_id %d\n", str_id);
 	retval = sst_validate_strid(str_id);
 	if (retval)
 		return -EINVAL;
-	BUG_ON(!mmap_buf);
 
 	stream = &sst_drv_ctx->streams[str_id];
 	if (stream->mmapped != true)
@@ -262,14 +262,24 @@ static int intel_sst_mmap_play_capture(u32 str_id,
 	stream->curr_bytes = 0;
 	stream->cumm_bytes = 0;
 
+	tmp_buf = kcalloc(mmap_buf->entries, sizeof(*tmp_buf), GFP_KERNEL);
+	if (!tmp_buf)
+		return -ENOMEM;
+	if (copy_from_user(tmp_buf, (void __user *)mmap_buf->buff,
+			mmap_buf->entries * sizeof(*tmp_buf))) {
+		retval = -EFAULT;
+		goto out_free;
+	}
+
 	pr_debug("sst:new buffers count %d status %d\n",
 			mmap_buf->entries, stream->status);
-	buf_entry = mmap_buf->buff;
+	buf_entry = tmp_buf;
 	for (i = 0; i < mmap_buf->entries; i++) {
-		BUG_ON(!buf_entry);
 		bufs = kzalloc(sizeof(*bufs), GFP_KERNEL);
-		if (!bufs)
-			return -ENOMEM;
+		if (!bufs) {
+			retval = -ENOMEM;
+			goto out_free;
+		}
 		bufs->size = buf_entry->size;
 		bufs->offset = buf_entry->offset;
 		bufs->addr = sst_drv_ctx->mmap_mem;
@@ -293,13 +303,15 @@ static int intel_sst_mmap_play_capture(u32 str_id,
 			if (sst_play_frame(str_id) < 0) {
 				pr_warn("sst: play frames fail\n");
 				mutex_unlock(&stream->lock);
-				return -EIO;
+				retval = -EIO;
+				goto out_free;
 			}
 		} else if (stream->ops = STREAM_OPS_CAPTURE) {
 			if (sst_capture_frame(str_id) < 0) {
 				pr_warn("sst: capture frame fail\n");
 				mutex_unlock(&stream->lock);
-				return -EIO;
+				retval = -EIO;
+				goto out_free;
 			}
 		}
 	}
@@ -314,6 +326,9 @@ static int intel_sst_mmap_play_capture(u32 str_id,
 	if (retval >= 0)
 		retval = stream->cumm_bytes;
 	pr_debug("sst:end of play/rec ioctl bytes = %d!!\n", retval);
+
+out_free:
+	kfree(tmp_buf);
 	return retval;
 }
 
