From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 15:19:02 +0000
Subject: [patch] drm/amdkfd: fix some range checks in address watch ioctl
Message-Id: <20150611151902.GF12192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Yair Shachar <yair.shachar@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

->buf_size_in_bytes must be large enough to hold ->num_watch_points and
->watch_mode so I have added a sizeof(int) * 2 to the minimum size.

Also we have to subtract sizeof(*args) from the max args_idx limit so
that it matches the allocation.  Also I changed a > to >= for the last
compare.

I moved the if (aw_info.num_watch_points > MAX_WATCH_ADDRESSES) { check
here so that we don't get an integer overflow on 32bit systems.  It's
harmless because we would have caught it later but it causes a static
checker warning.  I had to add a new include to get the
MAX_WATCH_ADDRESSES define.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I feel like this patch is probably not going to be merged without
changes.  Also we seem to set ->watch_address to the last address in the
buffer instead of the first?  It is very strange.  I am going on
vacation so I will be offline for a week.  Yair, if this patch isn't
right then feel free to fix it and give me a Reported-by tag.

Otherwise, I will see everyone on the flip side.  :)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 96c904b..54a608a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -36,6 +36,7 @@
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
 #include "kfd_dbgmgr.h"
+#include "../../radeon/cik_reg.h"
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -553,7 +554,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 	/* Validate arguments */
 
 	if ((args->buf_size_in_bytes > MAX_ALLOWED_AW_BUFF_SIZE) ||
-		(args->buf_size_in_bytes <= sizeof(*args)) ||
+		(args->buf_size_in_bytes <= sizeof(*args) + sizeof(int) * 2) ||
 		(cmd_from_user = NULL))
 		return -EINVAL;
 
@@ -576,6 +577,11 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 	aw_info.process = p;
 
 	aw_info.num_watch_points = *((uint32_t *)(&args_buff[args_idx]));
+	if (aw_info.num_watch_points = 0 ||
+	    aw_info.num_watch_points > MAX_WATCH_ADDRESSES) {
+		kfree(args_buff);
+		return -EINVAL;
+	}
 	args_idx += sizeof(aw_info.num_watch_points);
 
 	aw_info.watch_mode = (enum HSA_DBG_WATCH_MODE *) &args_buff[args_idx];
@@ -590,7 +596,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 	/* skip over the addresses buffer */
 	args_idx += sizeof(aw_info.watch_address) * aw_info.num_watch_points;
 
-	if (args_idx >= args->buf_size_in_bytes) {
+	if (args_idx >= args->buf_size_in_bytes - sizeof(*args)) {
 		kfree(args_buff);
 		return -EINVAL;
 	}
@@ -614,7 +620,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 		args_idx += sizeof(aw_info.watch_mask);
 	}
 
-	if (args_idx > args->buf_size_in_bytes) {
+	if (args_idx >= args->buf_size_in_bytes - sizeof(args)) {
 		kfree(args_buff);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 96153f2..d366757 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -301,12 +301,6 @@ static int dbgdev_address_watch_nodiq(struct kfd_dbgdev *dbgdev,
 	addrLo.u32All = 0;
 	cntl.u32All = 0;
 
-	if ((adw_info->num_watch_points > MAX_WATCH_ADDRESSES) ||
-			(adw_info->num_watch_points = 0)) {
-		pr_err("amdkfd: num_watch_points is invalid\n");
-		return -EINVAL;
-	}
-
 	if ((adw_info->watch_mode = NULL) ||
 		(adw_info->watch_address = NULL)) {
 		pr_err("amdkfd: adw_info fields are not valid\n");
@@ -369,12 +363,6 @@ static int dbgdev_address_watch_diq(struct kfd_dbgdev *dbgdev,
 	addrLo.u32All = 0;
 	cntl.u32All = 0;
 
-	if ((adw_info->num_watch_points > MAX_WATCH_ADDRESSES) ||
-			(adw_info->num_watch_points = 0)) {
-		pr_err("amdkfd: num_watch_points is invalid\n");
-		return -EINVAL;
-	}
-
 	if ((NULL = adw_info->watch_mode) ||
 			(NULL = adw_info->watch_address)) {
 		pr_err("amdkfd: adw_info fields are not valid\n");
