From: Dan Carpenter <error27@gmail.com>
Date: Tue, 19 Oct 2010 05:57:48 +0000
Subject: [patch 3/3] Staging: sst: fixups in SNDRV_SST_STREAM_DECODE
Message-Id: <20101019055748.GE5839@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Vinod Koul <vinod.koul@intel.com>, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Alan Cox <alan@linux.intel.com>

This is another patch about copying data to the kernel before using it.

SNDRV_SST_STREAM_DECODE is sort of tricky because we need to do a 
copy_from_user() that gives us another two pointers and we have copy
those.  Those again give us some more pointers that we have to copy.

Besides those problems, the code had a stack overflow:
-	struct snd_sst_buff_entry ibuf_temp[param->ibufs->entries],
-		obuf_temp[param->obufs->entries];
param->ibufs->entries comes from the user.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Is there no standard API for this kind of thing?

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index 8390aa7..d20724d 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -1105,62 +1105,83 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd, unsigned long arg)
 	}
 
 	case _IOC_NR(SNDRV_SST_STREAM_DECODE): {
-		struct snd_sst_dbufs *param -				(struct snd_sst_dbufs *)arg, dbufs_local;
-		int i;
+		struct snd_sst_dbufs param;
+		struct snd_sst_dbufs dbufs_local;
 		struct snd_sst_buffs ibufs, obufs;
-		struct snd_sst_buff_entry ibuf_temp[param->ibufs->entries],
-				obuf_temp[param->obufs->entries];
+		struct snd_sst_buff_entry *ibuf_tmp, *obuf_tmp;
+		char __user *dest;
 
 		pr_debug("sst: SNDRV_SST_STREAM_DECODE recived\n");
 		if (minor != STREAM_MODULE) {
 			retval = -EBADRQC;
 			break;
 		}
-		if (!param) {
-			retval = -EINVAL;
+		if (copy_from_user(&param, (void __user *)arg,
+				sizeof(param))) {
+			retval = -EFAULT;
 			break;
 		}
 
-		dbufs_local.input_bytes_consumed = param->input_bytes_consumed;
+		dbufs_local.input_bytes_consumed = param.input_bytes_consumed;
 		dbufs_local.output_bytes_produced -					param->output_bytes_produced;
-		dbufs_local.ibufs = &ibufs;
-		dbufs_local.obufs = &obufs;
-		dbufs_local.ibufs->entries = param->ibufs->entries;
-		dbufs_local.ibufs->type = param->ibufs->type;
-		dbufs_local.obufs->entries = param->obufs->entries;
-		dbufs_local.obufs->type = param->obufs->type;
-
-		dbufs_local.ibufs->buff_entry = ibuf_temp;
-		for (i = 0; i < dbufs_local.ibufs->entries; i++) {
-			ibuf_temp[i].buffer -				param->ibufs->buff_entry[i].buffer;
-			ibuf_temp[i].size -				param->ibufs->buff_entry[i].size;
+					param.output_bytes_produced;
+
+		if (copy_from_user(&ibufs, param.ibufs, sizeof(ibufs))) {
+			retval = -EFAULT;
+			break;
+		}
+		if (copy_from_user(&obufs, param.obufs, sizeof(obufs))) {
+			retval = -EFAULT;
+			break;
+		}
+
+		ibuf_tmp = kcalloc(ibufs.entries, sizeof(*ibuf_tmp), GFP_KERNEL);
+		obuf_tmp = kcalloc(obufs.entries, sizeof(*obuf_tmp), GFP_KERNEL);
+		if (!ibuf_tmp || !obuf_tmp) {
+			retval = -ENOMEM;
+			goto free_iobufs;
+		}
+
+		if (copy_from_user(ibuf_tmp, ibufs.buff_entry,
+				ibufs.entries * sizeof(*ibuf_tmp))) {
+			retval = -EFAULT;
+			goto free_iobufs;
 		}
-		dbufs_local.obufs->buff_entry = obuf_temp;
-		for (i = 0; i < dbufs_local.obufs->entries; i++) {
-			obuf_temp[i].buffer -				param->obufs->buff_entry[i].buffer;
-			obuf_temp[i].size -				param->obufs->buff_entry[i].size;
+		ibufs.buff_entry = ibuf_tmp;
+		dbufs_local.ibufs = &ibufs;
+
+		if (copy_from_user(obuf_tmp, obufs.buff_entry,
+				obufs.entries * sizeof(*obuf_tmp))) {
+			retval = -EFAULT;
+			goto free_iobufs;
 		}
+		obufs.buff_entry = obuf_tmp;
+		dbufs_local.obufs = &obufs;
+
 		retval = sst_decode(str_id, &dbufs_local);
-		if (retval)
-			retval =  -EAGAIN;
-		if (copy_to_user(&param->input_bytes_consumed,
+		if (retval) {
+			retval = -EAGAIN;
+			goto free_iobufs;
+		}
+
+		dest = (char *)arg + offsetof(struct snd_sst_dbufs, input_bytes_consumed);
+		if (copy_to_user(dest,
 				&dbufs_local.input_bytes_consumed,
 				sizeof(unsigned long long))) {
-			retval =  -EFAULT;
-			break;
+			retval = -EFAULT;
+			goto free_iobufs;
 		}
-		if (copy_to_user(&param->output_bytes_produced,
+
+		dest = (char *)arg + offsetof(struct snd_sst_dbufs, input_bytes_consumed);
+		if (copy_to_user(dest,
 				&dbufs_local.output_bytes_produced,
 				sizeof(unsigned long long))) {
-			retval =  -EFAULT;
-			break;
+			retval = -EFAULT;
+			goto free_iobufs;
 		}
+free_iobufs:
+		kfree(ibuf_tmp);
+		kfree(obuf_tmp);
 		break;
 	}
 
