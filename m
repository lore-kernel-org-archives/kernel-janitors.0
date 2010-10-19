From: Dan Carpenter <error27@gmail.com>
Date: Tue, 19 Oct 2010 05:57:04 +0000
Subject: [patch 2/3] Staging: sst: more dereferencing user pointers
Message-Id: <20101019055704.GD5839@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is another patch about making a copy of the data into kernel space
before using it.  It is easy to trigger a kernel oops in the original
code.  If you passed a NULL to SNDRV_SST_SET_TARGET_DEVICE then it
called BUG_ON().  And SNDRV_SST_DRIVER_INFO would let you write the
information to arbitrary memory locations which is a security violation.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index a0d13ee..8390aa7 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -838,7 +838,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		break;
 
 	case _IOC_NR(SNDRV_SST_STREAM_SET_PARAMS): {
-		struct snd_sst_params *str_param = (struct snd_sst_params *)arg;
+		struct snd_sst_params str_param;
 
 		pr_debug("sst: IOCTL_SET_PARAMS recieved!\n");
 		if (minor != STREAM_MODULE) {
@@ -846,17 +846,25 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 			break;
 		}
 
+		if (copy_from_user(&str_param, (void __user *)arg,
+				sizeof(str_param))) {
+			retval = -EFAULT;
+			break;
+		}
+
 		if (!str_id) {
 
-			retval = sst_get_stream(str_param);
+			retval = sst_get_stream(&str_param);
 			if (retval > 0) {
 				struct stream_info *str_info;
+				char __user *dest;
+
 				sst_drv_ctx->stream_cnt++;
 				data->str_id = retval;
 				str_info = &sst_drv_ctx->streams[retval];
 				str_info->src = SST_DRV;
-				retval = copy_to_user(&str_param->stream_id,
-						&retval, sizeof(__u32));
+				dest = (char *)arg + offsetof(struct snd_sst_params, stream_id);
+				retval = copy_to_user(dest, &retval, sizeof(__u32));
 				if (retval)
 					retval = -EFAULT;
 			} else {
@@ -866,16 +874,14 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		} else {
 			pr_debug("sst: SET_STREAM_PARAMS recieved!\n");
 			/* allocated set params only */
-			retval = sst_set_stream_param(str_id, str_param);
+			retval = sst_set_stream_param(str_id, &str_param);
 			/* Block the call for reply */
 			if (!retval) {
 				int sfreq = 0, word_size = 0, num_channel = 0;
-				sfreq =	str_param->sparams.uc.pcm_params.sfreq;
-				word_size = str_param->sparams.
-						uc.pcm_params.pcm_wd_sz;
-				num_channel = str_param->
-					sparams.uc.pcm_params.num_chan;
-				if (str_param->ops = STREAM_OPS_CAPTURE) {
+				sfreq =	str_param.sparams.uc.pcm_params.sfreq;
+				word_size = str_param.sparams.uc.pcm_params.pcm_wd_sz;
+				num_channel = str_param.sparams.uc.pcm_params.num_chan;
+				if (str_param.ops = STREAM_OPS_CAPTURE) {
 					sst_drv_ctx->scard_ops->\
 					set_pcm_audio_params(sfreq,
 						word_size, num_channel);
@@ -976,16 +982,22 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 	}
 
 	case _IOC_NR(SNDRV_SST_MMAP_PLAY):
-	case _IOC_NR(SNDRV_SST_MMAP_CAPTURE):
+	case _IOC_NR(SNDRV_SST_MMAP_CAPTURE): {
+		struct snd_sst_mmap_buffs mmap_buf;
+
 		pr_debug("sst: SNDRV_SST_MMAP_PLAY/CAPTURE recieved!\n");
 		if (minor != STREAM_MODULE) {
 			retval = -EBADRQC;
 			break;
 		}
-		retval = intel_sst_mmap_play_capture(str_id,
-				(struct snd_sst_mmap_buffs *)arg);
+		if (copy_from_user(&mmap_buf, (void __user *)arg,
+				sizeof(mmap_buf))) {
+			retval = -EFAULT;
+			break;
+		}
+		retval = intel_sst_mmap_play_capture(str_id, &mmap_buf);
 		break;
-
+	}
 	case _IOC_NR(SNDRV_SST_STREAM_DROP):
 		pr_debug("sst: SNDRV_SST_IOCTL_DROP recieved!\n");
 		if (minor != STREAM_MODULE) {
@@ -996,7 +1008,6 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		break;
 
 	case _IOC_NR(SNDRV_SST_STREAM_GET_TSTAMP): {
-		unsigned long long *ms = (unsigned long long *)arg;
 		struct snd_sst_tstamp tstamp = {0};
 		unsigned long long time, freq, mod;
 
@@ -1013,7 +1024,8 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		freq = (unsigned long long) tstamp.sampling_frequency;
 		time = time * 1000; /* converting it to ms */
 		mod = do_div(time, freq);
-		if (copy_to_user(ms, &time, sizeof(*ms)))
+		if (copy_to_user((void __user *)arg, &time,
+				sizeof(unsigned long long)))
 			retval = -EFAULT;
 		break;
 	}
@@ -1058,32 +1070,37 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 	}
 
 	case _IOC_NR(SNDRV_SST_SET_TARGET_DEVICE): {
-		struct snd_sst_target_device *target_device;
+		struct snd_sst_target_device target_device;
 
 		pr_debug("sst: SET_TARGET_DEVICE recieved!\n");
-		target_device =	(struct snd_sst_target_device *)arg;
-		BUG_ON(!target_device);
+		if (copy_from_user(&target_device, (void __user *)arg,
+				sizeof(target_device))) {
+			retval = -EFAULT;
+			break;
+		}
 		if (minor != AM_MODULE) {
 			retval = -EBADRQC;
 			break;
 		}
-		retval = sst_target_device_select(target_device);
+		retval = sst_target_device_select(&target_device);
 		break;
 	}
 
 	case _IOC_NR(SNDRV_SST_DRIVER_INFO): {
-		struct snd_sst_driver_info *info -			(struct snd_sst_driver_info *)arg;
+		struct snd_sst_driver_info info;
 
 		pr_debug("sst: SNDRV_SST_DRIVER_INFO recived\n");
-		info->version = SST_VERSION_NUM;
+		info.version = SST_VERSION_NUM;
 		/* hard coding, shud get sumhow later */
-		info->active_pcm_streams = sst_drv_ctx->stream_cnt -
+		info.active_pcm_streams = sst_drv_ctx->stream_cnt -
 						sst_drv_ctx->encoded_cnt;
-		info->active_enc_streams = sst_drv_ctx->encoded_cnt;
-		info->max_pcm_streams = MAX_ACTIVE_STREAM - MAX_ENC_STREAM;
-		info->max_enc_streams = MAX_ENC_STREAM;
-		info->buf_per_stream = sst_drv_ctx->mmap_len;
+		info.active_enc_streams = sst_drv_ctx->encoded_cnt;
+		info.max_pcm_streams = MAX_ACTIVE_STREAM - MAX_ENC_STREAM;
+		info.max_enc_streams = MAX_ENC_STREAM;
+		info.buf_per_stream = sst_drv_ctx->mmap_len;
+		if (copy_to_user((void __user *)arg, &info,
+				sizeof(info)))
+			retval = -EFAULT;
 		break;
 	}
 
