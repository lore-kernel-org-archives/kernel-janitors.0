From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:34:51 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - devfs_fs_kernel.h - compiler
Message-Id: <200402130834.51090.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_7JNLAs25pKR16S5"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_7JNLAs25pKR16S5
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_7JNLAs25pKR16S5
Content-Type: text/x-diff; charset="us-ascii"; name="devfs_fs_kernel.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="devfs_fs_kernel.h.diff"

--- linux-2.6.2.orig/include/linux/devfs_fs_kernel.h	2004-02-03 22:44:06.000000000 -0500
+++ linux-2.6.2/include/linux/devfs_fs_kernel.h	2004-02-13 08:05:58.000000000 -0500
@@ -26,29 +26,41 @@
 #else  /*  CONFIG_DEVFS_FS  */
 static inline int devfs_mk_bdev(dev_t dev, umode_t mode, const char *fmt, ...)
 {
+	dev = dev;
+	mode = mode;
+	fmt = fmt;
 	return 0;
 }
 static inline int devfs_mk_cdev(dev_t dev, umode_t mode, const char *fmt, ...)
 {
+	dev = dev;
+	mode = mode;
+	fmt = fmt;
 	return 0;
 }
 static inline int devfs_mk_symlink (const char *name, const char *link)
 {
-    return 0;
+	name = name;
+	link = link;
+	return 0;
 }
 static inline int devfs_mk_dir(const char *fmt, ...)
 {
+	fmt = fmt;
 	return 0;
 }
 static inline void devfs_remove(const char *fmt, ...)
 {
+	fmt = fmt;
 }
 static inline int devfs_register_tape (const char *name)
 {
-    return -1;
+	name = name;
+	return -1;
 }
 static inline void devfs_unregister_tape(int num)
 {
+	num = num;
 }
 static inline void mount_devfs_fs (void)
 {

--Boundary-00=_7JNLAs25pKR16S5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_7JNLAs25pKR16S5--
