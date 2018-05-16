From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Wed, 16 May 2018 18:26:36 +0000
Subject: [PATCH 1/5] staging: lustre: Fix inclusion of local headers
Message-Id: <20180516182636.5137-1-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jsimmons@infradead.org, andreas.dilger@intel.com, oleg.drokin@intel.com, lustre-devel@lists.lustre.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

This patch fixes the checkpatch.pl error:

ERROR:UAPI_INCLUDE: No #include in ...include/uapi/... should use a uapi/ path
prefix

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
 drivers/staging/lustre/include/uapi/linux/lnet/lnet-dlc.h     | 4 ++--
 drivers/staging/lustre/include/uapi/linux/lnet/lnetctl.h      | 2 +-
 drivers/staging/lustre/include/uapi/linux/lnet/nidstr.h       | 2 +-
 drivers/staging/lustre/include/uapi/linux/lustre/lustre_cfg.h | 2 +-
 drivers/staging/lustre/include/uapi/linux/lustre/lustre_fid.h | 2 +-
 drivers/staging/lustre/include/uapi/linux/lustre/lustre_idl.h | 4 ++--
 .../staging/lustre/include/uapi/linux/lustre/lustre_ioctl.h   | 2 +-
 .../staging/lustre/include/uapi/linux/lustre/lustre_ostid.h   | 2 +-
 .../staging/lustre/include/uapi/linux/lustre/lustre_user.h    | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/lustre/include/uapi/linux/lnet/lnet-dlc.h b/drivers/staging/lustre/include/uapi/linux/lnet/lnet-dlc.h
index c1619f411d81..1530ac26b449 100644
--- a/drivers/staging/lustre/include/uapi/linux/lnet/lnet-dlc.h
+++ b/drivers/staging/lustre/include/uapi/linux/lnet/lnet-dlc.h
@@ -29,8 +29,8 @@
 #ifndef LNET_DLC_H
 #define LNET_DLC_H
 
-#include <uapi/linux/lnet/libcfs_ioctl.h>
-#include <uapi/linux/lnet/lnet-types.h>
+#include "libcfs_ioctl.h"
+#include "lnet-types.h"
 
 #define MAX_NUM_SHOW_ENTRIES	32
 #define LNET_MAX_STR_LEN	128
diff --git a/drivers/staging/lustre/include/uapi/linux/lnet/lnetctl.h b/drivers/staging/lustre/include/uapi/linux/lnet/lnetctl.h
index cccb32dd28f2..c7be86610cc0 100644
--- a/drivers/staging/lustre/include/uapi/linux/lnet/lnetctl.h
+++ b/drivers/staging/lustre/include/uapi/linux/lnet/lnetctl.h
@@ -15,7 +15,7 @@
 #ifndef _LNETCTL_H_
 #define _LNETCTL_H_
 
-#include <uapi/linux/lnet/lnet-types.h>
+#include "lnet-types.h"
 
 /** \addtogroup lnet_fault_simulation
  * @{
diff --git a/drivers/staging/lustre/include/uapi/linux/lnet/nidstr.h b/drivers/staging/lustre/include/uapi/linux/lnet/nidstr.h
index 882074ed6021..d153c97ea64d 100644
--- a/drivers/staging/lustre/include/uapi/linux/lnet/nidstr.h
+++ b/drivers/staging/lustre/include/uapi/linux/lnet/nidstr.h
@@ -28,7 +28,7 @@
 #ifndef _LNET_NIDSTRINGS_H
 #define _LNET_NIDSTRINGS_H
 
-#include <uapi/linux/lnet/lnet-types.h>
+#include "lnet-types.h"
 
 /**
  *  Lustre Network Driver types.
diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_cfg.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_cfg.h
index 11b51d93f64c..a1dc912af960 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_cfg.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_cfg.h
@@ -35,7 +35,7 @@
 
 #include <linux/errno.h>
 #include <linux/kernel.h>
-#include <uapi/linux/lustre/lustre_user.h>
+#include "lustre_user.h"
 
 /** \defgroup cfg cfg
  *
diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fid.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fid.h
index 2e7a8d103777..1e347a86427c 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fid.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fid.h
@@ -37,7 +37,7 @@
 #ifndef _UAPI_LUSTRE_FID_H_
 #define _UAPI_LUSTRE_FID_H_
 
-#include <uapi/linux/lustre/lustre_idl.h>
+#include "lustre_idl.h"
 
 /** returns fid object sequence */
 static inline __u64 fid_seq(const struct lu_fid *fid)
diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_idl.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_idl.h
index aac98dbcf6e3..e6016a71ad23 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_idl.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_idl.h
@@ -72,8 +72,8 @@
 
 #include <uapi/linux/lnet/lnet-types.h>
 /* Defn's shared with user-space. */
-#include <uapi/linux/lustre/lustre_user.h>
-#include <uapi/linux/lustre/lustre_ver.h>
+#include "lustre_user.h"
+#include "lustre_ver.h"
 
 /*
  *  GENERAL STUFF
diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ioctl.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ioctl.h
index 6e4e109fb874..54e8fbbe98c4 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ioctl.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ioctl.h
@@ -31,7 +31,7 @@
 #include <linux/ioctl.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <uapi/linux/lustre/lustre_idl.h>
+#include "lustre_idl.h"
 
 #if !defined(__KERNEL__) && !defined(LUSTRE_UTILS)
 # error This file is for Lustre internal use only.
diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ostid.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ostid.h
index 3343b602219b..9110229b0886 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ostid.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_ostid.h
@@ -35,7 +35,7 @@
 #define _UAPI_LUSTRE_OSTID_H_
 
 #include <linux/errno.h>
-#include <uapi/linux/lustre/lustre_fid.h>
+#include "lustre_fid.h"
 
 static inline __u64 lmm_oi_id(const struct ost_id *oi)
 {
diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_user.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_user.h
index 5e332e3af68a..2fcfe2b2d365 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_user.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_user.h
@@ -55,7 +55,7 @@
 # include <sys/quota.h>
 # include <sys/stat.h>
 #endif /* __KERNEL__ */
-#include <uapi/linux/lustre/lustre_fiemap.h>
+#include "lustre_fiemap.h"
 
 /*
  * We need to always use 64bit version because the structure
-- 
2.17.0

