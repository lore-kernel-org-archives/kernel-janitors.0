From: Amol Bhave <ambhave@mit.edu>
Date: Wed, 17 Jun 2015 12:19:47 +0000
Subject: [PATCH] staging: include: remove editor specific lines (mode lines) from ./include
Message-Id: <1434543587-21415-1-git-send-email-ambhave@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes editor specific mode lines in compliance with Chapter
18 of Documentation/CodingStyle from header files in ./include directory.

Signed-off-by: Amol Bhave <ambhave@mit.edu>
---
 include/linux/configfs.h          |  4 +---
 include/linux/genl_magic_func.h   |  1 -
 include/linux/genl_magic_struct.h |  1 -
 include/target/configfs_macros.h  |  4 +---
 include/uapi/linux/chio.h         |  8 --------
 include/uapi/linux/if_bonding.h   | 11 -----------
 include/uapi/linux/nfs4.h         |  6 ------
 include/xen/interface/elfnote.h   | 10 ----------
 include/xen/interface/io/xenbus.h | 10 ----------
 9 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 34025df..156866b 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -1,6 +1,4 @@
-/* -*- mode: c; c-basic-offset: 8; -*-
- * vim: noexpandtab sw=8 ts=8 sts=0:
- *
+/*
  * configfs.h - definitions for the device driver filesystem
  *
  * This program is free software; you can redistribute it and/or
diff --git a/include/linux/genl_magic_func.h b/include/linux/genl_magic_func.h
index 667c311..16b347e 100644
--- a/include/linux/genl_magic_func.h
+++ b/include/linux/genl_magic_func.h
@@ -410,4 +410,3 @@ s_fields								\
 
 /* }}}1 */
 #endif /* GENL_MAGIC_FUNC_H */
-/* vim: set foldmethod=marker foldlevel=1 nofoldenable : */
diff --git a/include/linux/genl_magic_struct.h b/include/linux/genl_magic_struct.h
index eecd19b..22b7f07 100644
--- a/include/linux/genl_magic_struct.h
+++ b/include/linux/genl_magic_struct.h
@@ -274,4 +274,3 @@ enum {									\
 
 /* }}}1 */
 #endif /* GENL_MAGIC_STRUCT_H */
-/* vim: set foldmethod=marker nofoldenable : */
diff --git a/include/target/configfs_macros.h b/include/target/configfs_macros.h
index a0fc85b..454a203 100644
--- a/include/target/configfs_macros.h
+++ b/include/target/configfs_macros.h
@@ -1,6 +1,4 @@
-/* -*- mode: c; c-basic-offset: 8; -*-
- * vim: noexpandtab sw=8 ts=8 sts=0:
- *
+/*
  * configfs_macros.h - extends macros for configfs
  *
  * This program is free software; you can redistribute it and/or
diff --git a/include/uapi/linux/chio.h b/include/uapi/linux/chio.h
index d9bac7f..b84fc76 100644
--- a/include/uapi/linux/chio.h
+++ b/include/uapi/linux/chio.h
@@ -158,11 +158,3 @@ struct changer_set_voltag {
 #define CHIOINITELEM   _IO('c',17)
 #define CHIOSVOLTAG    _IOW('c',18,struct changer_set_voltag)
 #define CHIOGVPARAMS   _IOR('c',19,struct changer_vendor_params)
-
-/* ---------------------------------------------------------------------- */
-
-/*
- * Local variables:
- * c-basic-offset: 8
- * End:
- */
diff --git a/include/uapi/linux/if_bonding.h b/include/uapi/linux/if_bonding.h
index 9635a62..f713cf3 100644
--- a/include/uapi/linux/if_bonding.h
+++ b/include/uapi/linux/if_bonding.h
@@ -117,14 +117,3 @@ struct ad_info {
 };
 
 #endif /* _LINUX_IF_BONDING_H */
-
-/*
- * Local variables:
- *  version-control: t
- *  kept-new-versions: 5
- *  c-indent-level: 8
- *  c-basic-offset: 8
- *  tab-width: 8
- * End:
- */
-
diff --git a/include/uapi/linux/nfs4.h b/include/uapi/linux/nfs4.h
index adc0aff..d32bb3c 100644
--- a/include/uapi/linux/nfs4.h
+++ b/include/uapi/linux/nfs4.h
@@ -163,9 +163,3 @@
 #define NFS4_MAX_BACK_CHANNEL_OPS 2
 
 #endif /* _UAPI_LINUX_NFS4_H */
-
-/*
- * Local variables:
- *  c-basic-offset: 8
- * End:
- */
diff --git a/include/xen/interface/elfnote.h b/include/xen/interface/elfnote.h
index f90b034..16adc17 100644
--- a/include/xen/interface/elfnote.h
+++ b/include/xen/interface/elfnote.h
@@ -198,13 +198,3 @@
 #define XEN_ELFNOTE_MAX XEN_ELFNOTE_SUPPORTED_FEATURES
 
 #endif /* __XEN_PUBLIC_ELFNOTE_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-set-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/include/xen/interface/io/xenbus.h b/include/xen/interface/io/xenbus.h
index 9fda532..ff9f7b5 100644
--- a/include/xen/interface/io/xenbus.h
+++ b/include/xen/interface/io/xenbus.h
@@ -38,13 +38,3 @@ enum xenbus_state
 };
 
 #endif /* _XEN_PUBLIC_IO_XENBUS_H */
-
-/*
- * Local variables:
- *  c-file-style: "linux"
- *  indent-tabs-mode: t
- *  c-indent-level: 8
- *  c-basic-offset: 8
- *  tab-width: 8
- * End:
- */
-- 
2.4.2

