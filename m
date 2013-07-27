From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 27 Jul 2013 18:40:12 +0000
Subject: [PATCH 2/2] staging: lustre: Fix sparse warnings about obsolete struct initializer
Message-Id: <1374950412-15973-2-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes a lot of sparse warnings about use of obsolete
struct initializer.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/lustre/lustre/ldlm/ldlm_lib.c      |   16 +++----
 drivers/staging/lustre/lustre/ldlm/ldlm_lock.c     |   50 ++++++++++----------
 drivers/staging/lustre/lustre/ldlm/ldlm_request.c  |    5 +-
 .../lustre/lustre/libcfs/linux/linux-debug.c       |    6 +--
 .../lustre/lustre/libcfs/linux/linux-module.c      |    6 +--
 drivers/staging/lustre/lustre/mdc/mdc_request.c    |    2 +-
 6 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c
index aace534..950f90a 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lib.c
@@ -762,14 +762,14 @@ void target_send_reply(struct ptlrpc_request *req, int rc, int fail_id)
 EXPORT_SYMBOL(target_send_reply);
 
 ldlm_mode_t lck_compat_array[] = {
-	[LCK_EX] LCK_COMPAT_EX,
-	[LCK_PW] LCK_COMPAT_PW,
-	[LCK_PR] LCK_COMPAT_PR,
-	[LCK_CW] LCK_COMPAT_CW,
-	[LCK_CR] LCK_COMPAT_CR,
-	[LCK_NL] LCK_COMPAT_NL,
-	[LCK_GROUP] LCK_COMPAT_GROUP,
-	[LCK_COS] LCK_COMPAT_COS,
+	[LCK_EX]	= LCK_COMPAT_EX,
+	[LCK_PW]	= LCK_COMPAT_PW,
+	[LCK_PR]	= LCK_COMPAT_PR,
+	[LCK_CW]	= LCK_COMPAT_CW,
+	[LCK_CR]	= LCK_COMPAT_CR,
+	[LCK_NL]	= LCK_COMPAT_NL,
+	[LCK_GROUP]	= LCK_COMPAT_GROUP,
+	[LCK_COS]	= LCK_COMPAT_COS,
 };
 
 /**
diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
index ce1add1..a917420 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
@@ -49,45 +49,45 @@
 
 /* lock types */
 char *ldlm_lockname[] = {
-	[0] "--",
-	[LCK_EX] "EX",
-	[LCK_PW] "PW",
-	[LCK_PR] "PR",
-	[LCK_CW] "CW",
-	[LCK_CR] "CR",
-	[LCK_NL] "NL",
-	[LCK_GROUP] "GROUP",
-	[LCK_COS] "COS"
+	[0]		= "--",
+	[LCK_EX]	= "EX",
+	[LCK_PW]	= "PW",
+	[LCK_PR]	= "PR",
+	[LCK_CW]	= "CW",
+	[LCK_CR]	= "CR",
+	[LCK_NL]	= "NL",
+	[LCK_GROUP]	= "GROUP",
+	[LCK_COS]	= "COS",
 };
 EXPORT_SYMBOL(ldlm_lockname);
 
 char *ldlm_typename[] = {
-	[LDLM_PLAIN] "PLN",
-	[LDLM_EXTENT] "EXT",
-	[LDLM_FLOCK] "FLK",
-	[LDLM_IBITS] "IBT",
+	[LDLM_PLAIN]	= "PLN",
+	[LDLM_EXTENT]	= "EXT",
+	[LDLM_FLOCK]	= "FLK",
+	[LDLM_IBITS]	= "IBT",
 };
 EXPORT_SYMBOL(ldlm_typename);
 
 static ldlm_policy_wire_to_local_t ldlm_policy_wire18_to_local[] = {
-	[LDLM_PLAIN - LDLM_MIN_TYPE] ldlm_plain_policy_wire_to_local,
-	[LDLM_EXTENT - LDLM_MIN_TYPE] ldlm_extent_policy_wire_to_local,
-	[LDLM_FLOCK - LDLM_MIN_TYPE] ldlm_flock_policy_wire18_to_local,
-	[LDLM_IBITS - LDLM_MIN_TYPE] ldlm_ibits_policy_wire_to_local,
+	[LDLM_PLAIN - LDLM_MIN_TYPE]	= ldlm_plain_policy_wire_to_local,
+	[LDLM_EXTENT - LDLM_MIN_TYPE]	= ldlm_extent_policy_wire_to_local,
+	[LDLM_FLOCK - LDLM_MIN_TYPE]	= ldlm_flock_policy_wire18_to_local,
+	[LDLM_IBITS - LDLM_MIN_TYPE]	= ldlm_ibits_policy_wire_to_local,
 };
 
 static ldlm_policy_wire_to_local_t ldlm_policy_wire21_to_local[] = {
-	[LDLM_PLAIN - LDLM_MIN_TYPE] ldlm_plain_policy_wire_to_local,
-	[LDLM_EXTENT - LDLM_MIN_TYPE] ldlm_extent_policy_wire_to_local,
-	[LDLM_FLOCK - LDLM_MIN_TYPE] ldlm_flock_policy_wire21_to_local,
-	[LDLM_IBITS - LDLM_MIN_TYPE] ldlm_ibits_policy_wire_to_local,
+	[LDLM_PLAIN - LDLM_MIN_TYPE]	= ldlm_plain_policy_wire_to_local,
+	[LDLM_EXTENT - LDLM_MIN_TYPE]	= ldlm_extent_policy_wire_to_local,
+	[LDLM_FLOCK - LDLM_MIN_TYPE]	= ldlm_flock_policy_wire21_to_local,
+	[LDLM_IBITS - LDLM_MIN_TYPE]	= ldlm_ibits_policy_wire_to_local,
 };
 
 static ldlm_policy_local_to_wire_t ldlm_policy_local_to_wire[] = {
-	[LDLM_PLAIN - LDLM_MIN_TYPE] ldlm_plain_policy_local_to_wire,
-	[LDLM_EXTENT - LDLM_MIN_TYPE] ldlm_extent_policy_local_to_wire,
-	[LDLM_FLOCK - LDLM_MIN_TYPE] ldlm_flock_policy_local_to_wire,
-	[LDLM_IBITS - LDLM_MIN_TYPE] ldlm_ibits_policy_local_to_wire,
+	[LDLM_PLAIN - LDLM_MIN_TYPE]	= ldlm_plain_policy_local_to_wire,
+	[LDLM_EXTENT - LDLM_MIN_TYPE]	= ldlm_extent_policy_local_to_wire,
+	[LDLM_FLOCK - LDLM_MIN_TYPE]	= ldlm_flock_policy_local_to_wire,
+	[LDLM_IBITS - LDLM_MIN_TYPE]	= ldlm_ibits_policy_local_to_wire,
 };
 
 /**
diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_request.c b/drivers/staging/lustre/lustre/ldlm/ldlm_request.c
index c900706..6f21a12 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_request.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_request.c
@@ -2068,7 +2068,10 @@ void ldlm_namespace_foreach(struct ldlm_namespace *ns,
 			    ldlm_iterator_t iter, void *closure)
 
 {
-	struct iter_helper_data helper = { iter: iter, closure: closure };
+	struct iter_helper_data helper = {
+		.iter		= iter,
+		.closure	= closure,
+	};
 
 	cfs_hash_for_each_nolock(ns->ns_rs_hash,
 				 ldlm_res_iter_helper, &helper);
diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c
index 6afb350..9b57304 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c
@@ -194,9 +194,9 @@ static int panic_notifier(struct notifier_block *self, unsigned long unused1,
 }
 
 static struct notifier_block libcfs_panic_notifier = {
-	notifier_call :     panic_notifier,
-	next :	      NULL,
-	priority :	  10000
+	.notifier_call	= panic_notifier,
+	.next		= NULL,
+	.priority	= 10000,
 };
 
 void libcfs_register_panic_notifier(void)
diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
index d8f320e..7449f4f 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
@@ -171,9 +171,9 @@ static long libcfs_ioctl(struct file *file,
 }
 
 static struct file_operations libcfs_fops = {
-	unlocked_ioctl: libcfs_ioctl,
-	open :	  libcfs_psdev_open,
-	release :       libcfs_psdev_release
+	.unlocked_ioctl	= libcfs_ioctl,
+	.open		= libcfs_psdev_open,
+	.release	= libcfs_psdev_release,
 };
 
 struct miscdevice libcfs_dev = {
diff --git a/drivers/staging/lustre/lustre/mdc/mdc_request.c b/drivers/staging/lustre/lustre/mdc/mdc_request.c
index 191edc6..2dabfc0 100644
--- a/drivers/staging/lustre/lustre/mdc/mdc_request.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_request.c
@@ -2378,7 +2378,7 @@ static int mdc_resource_inode_free(struct ldlm_resource *res)
 }
 
 struct ldlm_valblock_ops inode_lvbo = {
-	lvbo_free: mdc_resource_inode_free
+	.lvbo_free = mdc_resource_inode_free,
 };
 
 static int mdc_setup(struct obd_device *obd, struct lustre_cfg *cfg)
-- 
1.7.10.4

