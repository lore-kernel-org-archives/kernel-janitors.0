From: Dan Carpenter <error27@gmail.com>
Date: Wed, 20 Oct 2010 06:58:30 +0000
Subject: [patch 2/2] Staging: sst: add some __user anotations
Message-Id: <20101020065830.GB5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This silences all the sparse warnings in intel_sst_app_interface.c.
It was just a matter of adding __user annotations, I didn't find any
real bugs here.  Quite a few of these were needed for stuff I added
earlier, sorry about that.

I removed a couple casts to (void *) that caused a warning like:
	drivers/staging/intel_sst/intel_sst_app_interface.c:606:27:
		warning: cast removes address space of expression
For example sst_drv_ctx->mailbox is already declared as
"void __iomem *mailbox" so casting it to void pointer isn't necessary
and it makes sparse complain because it removes the __user attribute.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/intel_sst/intel_sst_common.h b/drivers/staging/intel_sst/intel_sst_common.h
index 73a98c8..5795567 100644
--- a/drivers/staging/intel_sst/intel_sst_common.h
+++ b/drivers/staging/intel_sst/intel_sst_common.h
@@ -231,8 +231,8 @@ struct stream_info {
 	spinlock_t          pcm_lock;
 	bool			mmapped;
 	unsigned int		sg_index; /*  current buf Index  */
-	unsigned char		*cur_ptr; /*  Current static bufs  */
-	struct snd_sst_buf_entry *buf_entry;
+	unsigned char __user 	*cur_ptr; /*  Current static bufs  */
+	struct snd_sst_buf_entry __user *buf_entry;
 	struct sst_block	data_blk; /* stream ops block */
 	struct sst_block	ctrl_blk; /* stream control cmd block */
 	enum snd_sst_buf_type   buf_type;
diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index 834bb61..9618c79 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -392,7 +392,7 @@ static int snd_sst_fill_kernel_list(struct stream_info *stream,
 {
 	struct sst_stream_bufs *stream_bufs;
 	unsigned long index, mmap_len;
-	unsigned char *bufp;
+	unsigned char __user *bufp;
 	unsigned long size, copied_size;
 	int retval = 0, add_to_list = 0;
 	static int sent_offset;
@@ -527,9 +527,7 @@ static int snd_sst_copy_userbuf_capture(struct stream_info *stream,
 			/* copy to user */
 			list_for_each_entry_safe(entry, _entry,
 						copy_to_list, node) {
-				if (copy_to_user((void *)
-					     iovec[entry->iov_index].iov_base +
-					     entry->iov_offset,
+				if (copy_to_user(iovec[entry->iov_index].iov_base + entry->iov_offset,
 					     kbufs->addr + entry->offset,
 					     entry->size)) {
 					/* Clean up the list and return error */
@@ -605,7 +603,7 @@ static int intel_sst_read_write(unsigned int str_id, char __user *buf,
 			buf, (int) count, (int) stream->status);
 
 	stream->buf_type = SST_BUF_USER_STATIC;
-	iovec.iov_base = (void *)buf;
+	iovec.iov_base = buf;
 	iovec.iov_len  = count;
 	nr_segs = 1;
 
@@ -878,7 +876,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 				data->str_id = retval;
 				str_info = &sst_drv_ctx->streams[retval];
 				str_info->src = SST_DRV;
-				dest = (char *)arg + offsetof(struct snd_sst_params, stream_id);
+				dest = (char __user *)arg + offsetof(struct snd_sst_params, stream_id);
 				retval = copy_to_user(dest, &retval, sizeof(__u32));
 				if (retval)
 					retval = -EFAULT;
@@ -947,7 +945,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		pr_debug("sst: id:%d\n, vol:%d, ramp_dur:%d, ramp_type:%d\n",
 				get_vol.stream_id, get_vol.volume,
 				get_vol.ramp_duration, get_vol.ramp_type);
-		if (copy_to_user((struct snd_sst_vol *)arg,
+		if (copy_to_user((struct snd_sst_vol __user *)arg,
 				&get_vol, sizeof(get_vol))) {
 			retval = -EFAULT;
 			break;
@@ -987,7 +985,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			retval = -EIO;
 			break;
 		}
-		if (copy_to_user((struct snd_sst_get_stream_params *)arg,
+		if (copy_to_user((struct snd_sst_get_stream_params __user *)arg,
 					&get_params, sizeof(get_params))) {
 			retval = -EFAULT;
 			break;
@@ -1032,8 +1030,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			break;
 		}
 		memcpy_fromio(&tstamp,
-			((void *)(sst_drv_ctx->mailbox + SST_TIME_STAMP)
-			+(str_id * sizeof(tstamp))),
+			sst_drv_ctx->mailbox + SST_TIME_STAMP + str_id * sizeof(tstamp),
 			sizeof(tstamp));
 		time = tstamp.samples_rendered;
 		freq = (unsigned long long) tstamp.sampling_frequency;
@@ -1141,11 +1138,11 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		dbufs_local.output_bytes_produced  					param.output_bytes_produced;
 
-		if (copy_from_user(&ibufs, param.ibufs, sizeof(ibufs))) {
+		if (copy_from_user(&ibufs, (void __user *)param.ibufs, sizeof(ibufs))) {
 			retval = -EFAULT;
 			break;
 		}
-		if (copy_from_user(&obufs, param.obufs, sizeof(obufs))) {
+		if (copy_from_user(&obufs, (void __user *)param.obufs, sizeof(obufs))) {
 			retval = -EFAULT;
 			break;
 		}
@@ -1157,7 +1154,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			goto free_iobufs;
 		}
 
-		if (copy_from_user(ibuf_tmp, ibufs.buff_entry,
+		if (copy_from_user(ibuf_tmp, (void __user *)ibufs.buff_entry,
 				ibufs.entries * sizeof(*ibuf_tmp))) {
 			retval = -EFAULT;
 			goto free_iobufs;
@@ -1165,7 +1162,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		ibufs.buff_entry = ibuf_tmp;
 		dbufs_local.ibufs = &ibufs;
 
-		if (copy_from_user(obuf_tmp, obufs.buff_entry,
+		if (copy_from_user(obuf_tmp, (void __user *)obufs.buff_entry,
 				obufs.entries * sizeof(*obuf_tmp))) {
 			retval = -EFAULT;
 			goto free_iobufs;
@@ -1179,7 +1176,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			goto free_iobufs;
 		}
 
-		dest = (char *)arg + offsetof(struct snd_sst_dbufs, input_bytes_consumed);
+		dest = (char __user *)arg + offsetof(struct snd_sst_dbufs, input_bytes_consumed);
 		if (copy_to_user(dest,
 				&dbufs_local.input_bytes_consumed,
 				sizeof(unsigned long long))) {
@@ -1187,7 +1184,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			goto free_iobufs;
 		}
 
-		dest = (char *)arg + offsetof(struct snd_sst_dbufs, input_bytes_consumed);
+		dest = (char __user *)arg + offsetof(struct snd_sst_dbufs, input_bytes_consumed);
 		if (copy_to_user(dest,
 				&dbufs_local.output_bytes_produced,
 				sizeof(unsigned long long))) {
@@ -1210,7 +1207,7 @@ free_iobufs:
 		break;
 
 	case _IOC_NR(SNDRV_SST_STREAM_BYTES_DECODED): {
-		unsigned long long *bytes = (unsigned long long *)arg;
+		unsigned long long __user *bytes = (unsigned long long __user *)arg;
 		struct snd_sst_tstamp tstamp = {0};
 
 		pr_debug("sst: STREAM_BYTES_DECODED recieved!\n");
@@ -1219,8 +1216,7 @@ free_iobufs:
 			break;
 		}
 		memcpy_fromio(&tstamp,
-			((void *)(sst_drv_ctx->mailbox + SST_TIME_STAMP)
-			+(str_id * sizeof(tstamp))),
+			sst_drv_ctx->mailbox + SST_TIME_STAMP + str_id * sizeof(tstamp),
 			sizeof(tstamp));
 		if (copy_to_user(bytes, &tstamp.bytes_processed,
 				sizeof(*bytes)))
@@ -1243,7 +1239,7 @@ free_iobufs:
 			kfree(fw_info);
 			break;
 		}
-		if (copy_to_user((struct snd_sst_dbufs *)arg,
+		if (copy_to_user((struct snd_sst_dbufs __user *)arg,
 				fw_info, sizeof(*fw_info))) {
 			kfree(fw_info);
 			retval = -EFAULT;
