From: Dan Carpenter <error27@gmail.com>
Date: Tue, 19 Oct 2010 05:56:24 +0000
Subject: [patch 1/3] Staging: sst: dereferencing user pointers
Message-Id: <20101019055624.GC5839@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code dereferences user supplied pointers directly instead of doing
a copy_from_user().  Some kernel configs put user and kernel memory in
different address spaces so this code isn't portable.  Also the user
memory could be swapped out or in this case the pointer could just be
NULL leading to an oops.

Another thing is that it makes permission tests like this sort of
meaningless.
	if (minor = STREAM_MODULE && rec_mute->stream_id = 0) {
		retval = -EPERM;
		break;
	}
The user could set stream_id to 1 for the test and then change it later.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index 463e5cb..a0d13ee 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -885,41 +885,39 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 		break;
 	}
 	case _IOC_NR(SNDRV_SST_SET_VOL): {
-		struct snd_sst_vol *set_vol;
-		struct snd_sst_vol *rec_vol = (struct snd_sst_vol *)arg;
+		struct snd_sst_vol set_vol;
+
+		if (copy_from_user(&set_vol, (void __user *)arg,
+				sizeof(set_vol))) {
+			pr_debug("sst: copy failed\n");
+			retval = -EFAULT;
+			break;
+		}
 		pr_debug("sst: SET_VOLUME recieved for %d!\n",
-				rec_vol->stream_id);
-		if (minor = STREAM_MODULE && rec_vol->stream_id = 0) {
+				set_vol.stream_id);
+		if (minor = STREAM_MODULE && set_vol.stream_id = 0) {
 			pr_debug("sst: invalid operation!\n");
 			retval = -EPERM;
 			break;
 		}
-		set_vol = kzalloc(sizeof(*set_vol), GFP_ATOMIC);
-		if (!set_vol) {
-			pr_debug("sst: mem allocation failed\n");
-			retval = -ENOMEM;
-			break;
-		}
-		if (copy_from_user(set_vol, rec_vol, sizeof(*set_vol))) {
-			pr_debug("sst: copy failed\n");
-			retval = -EFAULT;
-			break;
-		}
-		retval = sst_set_vol(set_vol);
-		kfree(set_vol);
+		retval = sst_set_vol(&set_vol);
 		break;
 	}
 	case _IOC_NR(SNDRV_SST_GET_VOL): {
-		struct snd_sst_vol *rec_vol = (struct snd_sst_vol *)arg;
 		struct snd_sst_vol get_vol;
+
+		if (copy_from_user(&get_vol, (void __user *)arg,
+				sizeof(get_vol))) {
+			retval = -EFAULT;
+			break;
+		}
 		pr_debug("sst: IOCTL_GET_VOLUME recieved for stream = %d!\n",
-				rec_vol->stream_id);
-		if (minor = STREAM_MODULE && rec_vol->stream_id = 0) {
+				get_vol.stream_id);
+		if (minor = STREAM_MODULE && get_vol.stream_id = 0) {
 			pr_debug("sst: invalid operation!\n");
 			retval = -EPERM;
 			break;
 		}
-		get_vol.stream_id = rec_vol->stream_id;
 		retval = sst_get_vol(&get_vol);
 		if (retval) {
 			retval = -EIO;
@@ -938,25 +936,20 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 	}
 
 	case _IOC_NR(SNDRV_SST_MUTE): {
-		struct snd_sst_mute *set_mute;
-		struct snd_sst_vol *rec_mute = (struct snd_sst_vol *)arg;
-		pr_debug("sst: SNDRV_SST_SET_VOLUME recieved for %d!\n",
-			rec_mute->stream_id);
-		if (minor = STREAM_MODULE && rec_mute->stream_id = 0) {
-			retval = -EPERM;
-			break;
-		}
-		set_mute = kzalloc(sizeof(*set_mute), GFP_ATOMIC);
-		if (!set_mute) {
-			retval = -ENOMEM;
+		struct snd_sst_mute set_mute;
+
+		if (copy_from_user(&set_mute, (void __user *)arg,
+				sizeof(set_mute))) {
+			retval = -EFAULT;
 			break;
 		}
-		if (copy_from_user(set_mute, rec_mute, sizeof(*set_mute))) {
-			retval = -EFAULT;
+		pr_debug("sst: SNDRV_SST_SET_VOLUME recieved for %d!\n",
+			set_mute.stream_id);
+		if (minor = STREAM_MODULE && set_mute.stream_id = 0) {
+			retval = -EPERM;
 			break;
 		}
-		retval = sst_set_mute(set_mute);
-		kfree(set_mute);
+		retval = sst_set_mute(&set_mute);
 		break;
 	}
 	case _IOC_NR(SNDRV_SST_STREAM_GET_PARAMS): {
