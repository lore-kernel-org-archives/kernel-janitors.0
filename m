From: MJK <mkemp@cs.nmsu.edu>
Date: Sun, 06 Jun 2004 09:02:04 +0000
Subject: [Kernel-janitors] [PATCH] linux-2.6.7-rc2/fs/cifs/cifsfs.c
Message-Id: <Pine.LNX.4.58.0406060258100.19187@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94066590362217195=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94066590362217195==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Compiles. I thought the error handling could use a little
improvement. :)


--MJK

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Description  : Audits kernel_thread() and does a cosmetic change to the
way errors are handled.

Signed-off-by: MJK <mkemp@cs.nmsu.edu>

--- old.linux-2.6.7-rc2/fs/cifs/cifsfs.c	2004-06-02 02:58:58.000000000 -0600
+++ new.linux-2.6.7-rc2/fs/cifs/cifsfs.c	2004-06-06 02:32:27.494962953 -0600
@@ -761,25 +761,51 @@

 	rc = cifs_init_inodecache();
 	if (!rc) {
-		rc = cifs_init_mids();
-		if (!rc) {
-			rc = cifs_init_request_bufs();
-			if (!rc) {
-				rc = register_filesystem(&cifs_fs_type);
-				if (!rc) {
-					kernel_thread(cifs_oplock_thread, NULL,
-						CLONE_FS | CLONE_FILES | CLONE_VM);
-					return rc; /* Success */
-				} else
-					cifs_destroy_request_bufs();
-			}
-			cifs_destroy_mids();
-		}
-		cifs_destroy_inodecache();
+		printk(KERN_ERR "cifs_init_inodecache: error initilizing.\n");
+		goto error_init;
 	}
+
+	rc = cifs_init_mids();
+	if (!rc) {
+		goto error_init_mids;
+	}
+
+	rc = cifs_init_request_bufs();
+	if (!rc) {
+		goto error_request;
+	}
+
+	rc = register_filesystem(&cifs_fs_type);
+	if (!rc) {
+		printk(KERN_ERR "Couldn't register cifs.\n");
+		goto error_reg_fs;
+	}
+
+	rc = kernel_thread(cifs_oplock_thread, NULL, CLONE_FS | CLONE_FILES | CLONE_VM);
+	if (!rc) {
+		printk(KERN_ERR "Couldn't spawn cifs thread.\n");
+		goto error_kt;
+	}
+
+	return rc;
+
+error_kt:
+
+error_reg_fs:
+	cifs_destroy_request_bufs();
+
+error_request:
+	cifs_destroy_mids();
+
+error_init_mids:
+	cifs_destroy_inodecache();
+
+error_init:
+
 #ifdef CONFIG_PROC_FS
 	cifs_proc_clean();
 #endif
+
 	return rc;
 }


--===============94066590362217195==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94066590362217195==--
