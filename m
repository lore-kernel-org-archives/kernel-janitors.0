From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:17 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 3/16] ifdefs:
Message-Id: <20040508233817.GA4094@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78903665601523132=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78903665601523132==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/mtd/mtdcore.c	2004-04-04 05:37:06.000000000 +0200
+++ a/drivers/mtd/mtdcore.c	2004-05-09 00:13:30.000000000 +0200
@@ -335,9 +335,7 @@
 
 #ifdef CONFIG_PROC_FS
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
 static struct proc_dir_entry *proc_mtd;
-#endif
 
 static inline int mtd_proc_info (char *buf, int i)
 {
@@ -351,12 +349,7 @@
 }
 
 static int mtd_read_proc ( char *page, char **start, off_t off,int count
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
-                       ,int *eof, void *data_unused
-#else
-                        ,int unused
-#endif
-			)
+                       ,int *eof, void *data_unused)
 {
 	int len, l, i;
         off_t   begin = 0;
@@ -376,9 +369,7 @@
                 }
         }
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
         *eof = 1;
-#endif
 
 done:
 	up(&mtd_table_mutex);
@@ -388,18 +379,6 @@
         return ((count < begin+len-off) ? count : begin+len-off);
 }
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0)
-struct proc_dir_entry mtd_proc_entry = {
-        0,                 /* low_ino: the inode -- dynamic */
-        3, "mtd",     /* len of name and name */
-        S_IFREG | S_IRUGO, /* mode */
-        1, 0, 0,           /* nlinks, owner, group */
-        0, NULL,           /* size - unused; operations -- use default */
-        &mtd_read_proc,   /* function used to read data */
-        /* nothing more */
-    };
-#endif
-
 #endif /* CONFIG_PROC_FS */
 
 /*====================================================================*/
@@ -408,16 +387,8 @@
 int __init init_mtd(void)
 {
 #ifdef CONFIG_PROC_FS
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
 	if ((proc_mtd = create_proc_entry( "mtd", 0, 0 )))
 	  proc_mtd->read_proc = mtd_read_proc;
-#else
-        proc_register_dynamic(&proc_root,&mtd_proc_entry);
-#endif
-#endif
-
-#if LINUX_VERSION_CODE < 0x20212
-	init_mtd_devices();
 #endif
 
 #ifdef CONFIG_PM
@@ -436,12 +407,8 @@
 #endif
 
 #ifdef CONFIG_PROC_FS
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
         if (proc_mtd)
           remove_proc_entry( "mtd", 0);
-#else
-        proc_unregister(&proc_root,mtd_proc_entry.low_ino);
-#endif
 #endif
 }
 

--===============78903665601523132==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78903665601523132==--
