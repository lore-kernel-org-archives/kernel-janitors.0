From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 19:10:44 +0000
Subject: [patch 3/2] Staging: sst: more copy_to_user() changes
Message-Id: <20101015191044.GM6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vinod wanted the copy_to_user() calls in this format:
	if (copy_to_user())
		retval = -EFAULT;
instead of this:
	retval = copy_to_user();
	if (retval)
		retval = -EFAULt;

I've done that for the whole intel_sst_app_interface.c file.  In the
process I noticed a couple more places that returned -EBUSY or -EAGAIN
instead of -EFAULT.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This applies on top of my earlier patches.
Btw.  Please understand that I don't have this hardware, and even though
I try to be very careful I can't actually test these changes.

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index b92ce37..463e5cb 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -376,7 +376,7 @@ static int snd_sst_fill_kernel_list(struct stream_info *stream,
 			struct list_head *copy_to_list)
 {
 	struct sst_stream_bufs *stream_bufs;
-	unsigned long index, data_not_copied, mmap_len;
+	unsigned long index, mmap_len;
 	unsigned char *bufp;
 	unsigned long size, copied_size;
 	int retval = 0, add_to_list = 0;
@@ -397,10 +397,9 @@ static int snd_sst_fill_kernel_list(struct stream_info *stream,
 			stream->sg_index = index;
 			if (!stream_bufs)
 				return -ENOMEM;
-			retval = copy_from_user((void *) &rar_handle,
-						iovec[index].iov_base,
-						sizeof(__u32));
-			if (retval != 0)
+			if (copy_from_user((void *) &rar_handle,
+					iovec[index].iov_base,
+					sizeof(__u32)))
 				return -EFAULT;
 			stream_bufs->addr = (char *)rar_handle;
 			stream_bufs->in_use = false;
@@ -436,10 +435,9 @@ static int snd_sst_fill_kernel_list(struct stream_info *stream,
 
 
 		if (stream->ops = STREAM_OPS_PLAYBACK) {
-			data_not_copied = copy_from_user(
-				(void *)(stream_bufs->addr + copied_size),
-				bufp, size);
-			if (data_not_copied > 0) {
+			if (copy_from_user((void *)
+					(stream_bufs->addr + copied_size),
+					bufp, size)) {
 				/* Clean up the list and return error code */
 				retval = -EFAULT;
 				break;
@@ -506,7 +504,6 @@ static int snd_sst_copy_userbuf_capture(struct stream_info *stream,
 	struct snd_sst_user_cap_list *entry, *_entry;
 	struct sst_stream_bufs *kbufs = NULL, *_kbufs;
 	int retval = 0;
-	unsigned long data_not_copied;
 
 	/* copy sent buffers */
 	pr_debug("sst: capture stream copying to user now...\n");
@@ -515,12 +512,11 @@ static int snd_sst_copy_userbuf_capture(struct stream_info *stream,
 			/* copy to user */
 			list_for_each_entry_safe(entry, _entry,
 						copy_to_list, node) {
-				data_not_copied = copy_to_user((void *)
-					iovec[entry->iov_index].iov_base +
-						entry->iov_offset,
-					kbufs->addr + entry->offset,
-					entry->size);
-				if (data_not_copied > 0) {
+				if (copy_to_user((void *)
+					     iovec[entry->iov_index].iov_base +
+					     entry->iov_offset,
+					     kbufs->addr + entry->offset,
+					     entry->size)) {
 					/* Clean up the list and return error */
 					retval = -EFAULT;
 					break;
@@ -904,10 +900,9 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			retval = -ENOMEM;
 			break;
 		}
-		retval = copy_from_user(set_vol, rec_vol, sizeof(*set_vol));
-		if (retval) {
+		if (copy_from_user(set_vol, rec_vol, sizeof(*set_vol))) {
 			pr_debug("sst: copy failed\n");
-			retval = -EAGAIN;
+			retval = -EFAULT;
 			break;
 		}
 		retval = sst_set_vol(set_vol);
@@ -933,9 +928,8 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		pr_debug("sst: id:%d\n, vol:%d, ramp_dur:%d, ramp_type:%d\n",
 				get_vol.stream_id, get_vol.volume,
 				get_vol.ramp_duration, get_vol.ramp_type);
-		retval = copy_to_user((struct snd_sst_vol *)arg,
-						&get_vol, sizeof(get_vol));
-		if (retval) {
+		if (copy_to_user((struct snd_sst_vol *)arg,
+				&get_vol, sizeof(get_vol))) {
 			retval = -EFAULT;
 			break;
 		}
@@ -957,8 +951,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			retval = -ENOMEM;
 			break;
 		}
-		retval = copy_from_user(set_mute, rec_mute, sizeof(*set_mute));
-		if (retval) {
+		if (copy_from_user(set_mute, rec_mute, sizeof(*set_mute))) {
 			retval = -EFAULT;
 			break;
 		}
@@ -980,10 +973,9 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			retval = -EIO;
 			break;
 		}
-		retval = copy_to_user((struct snd_sst_get_stream_params *)arg,
-					&get_params, sizeof(get_params));
-		if (retval) {
-			retval = -EBUSY;
+		if (copy_to_user((struct snd_sst_get_stream_params *)arg,
+					&get_params, sizeof(get_params))) {
+			retval = -EFAULT;
 			break;
 		}
 		sst_print_stream_params(&get_params);
@@ -1028,8 +1020,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		freq = (unsigned long long) tstamp.sampling_frequency;
 		time = time * 1000; /* converting it to ms */
 		mod = do_div(time, freq);
-		retval = copy_to_user(ms, &time, sizeof(*ms));
-		if (retval)
+		if (copy_to_user(ms, &time, sizeof(*ms)))
 			retval = -EFAULT;
 		break;
 	}
@@ -1148,17 +1139,15 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		retval = sst_decode(str_id, &dbufs_local);
 		if (retval)
 			retval =  -EAGAIN;
-		retval = copy_to_user(&param->input_bytes_consumed,
-			&dbufs_local.input_bytes_consumed,
-			sizeof(unsigned long long));
-		if (retval) {
+		if (copy_to_user(&param->input_bytes_consumed,
+				&dbufs_local.input_bytes_consumed,
+				sizeof(unsigned long long))) {
 			retval =  -EFAULT;
 			break;
 		}
-		retval = copy_to_user(&param->output_bytes_produced,
+		if (copy_to_user(&param->output_bytes_produced,
 				&dbufs_local.output_bytes_produced,
-				sizeof(unsigned long long));
-		if (retval) {
+				sizeof(unsigned long long))) {
 			retval =  -EFAULT;
 			break;
 		}
@@ -1187,9 +1176,8 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			((void *)(sst_drv_ctx->mailbox + SST_TIME_STAMP)
 			+(str_id * sizeof(tstamp))),
 			sizeof(tstamp));
-		retval = copy_to_user(bytes, &tstamp.bytes_processed,
-					sizeof(*bytes));
-		if (retval)
+		if (copy_to_user(bytes, &tstamp.bytes_processed,
+				sizeof(*bytes)))
 			retval = -EFAULT;
 		break;
 	}
@@ -1209,9 +1197,8 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			kfree(fw_info);
 			break;
 		}
-		retval = copy_to_user((struct snd_sst_dbufs *)arg,
-					fw_info, sizeof(*fw_info));
-		if (retval) {
+		if (copy_to_user((struct snd_sst_dbufs *)arg,
+				fw_info, sizeof(*fw_info))) {
 			kfree(fw_info);
 			retval = -EFAULT;
 			break;
