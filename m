From: MJK <mkemp@cs.nmsu.edu>
Date: Tue, 08 Jun 2004 07:54:13 +0000
Subject: [Kernel-janitors] [REDIFF] new.linux-2.6.7-rc2/fs/cifs/cifsfs.c
Message-Id: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47688355819745865=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47688355819745865==
Content-Type: TEXT/PLAIN; charset=US-ASCII


Description  : Audits kernel_thread() and does a cosmetic change to the
way errors are handled with (hopefully) helpfull error messages.

Signed-off-by: MJK <mkemp@cs.nmsu.edu>

--- old.linux-2.6.7-rc2/fs/cifs/cifsfs.c	2004-06-02 02:58:58.000000000 -0600
+++ new.linux-2.6.7-rc2/fs/cifs/cifsfs.c	2004-06-08 01:51:19.572543112 -0600
@@ -761,25 +761,53 @@

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
+		printk(KERN_ERR "cifs_init_inodecache, error code = %d.\n", rc);
+		goto error_init;
 	}
+
+	rc = cifs_init_mids();
+	if (!rc) {
+		printk(KERN_ERR "cifs_init_mids, error code = %d\n.", rc);
+		goto error_init_mids;
+	}
+
+	rc = cifs_init_request_bufs();
+	if (!rc) {
+		printk(KERN_ERR "cifs_init_request_bufs, error code = %d\n.", rc);
+		goto error_request;
+	}
+
+	rc = register_filesystem(&cifs_fs_type);
+	if (!rc) {
+		printk(KERN_ERR "Couldn't register cifs, error code = %d\n.", rc);
+		goto error_reg_fs;
+	}
+
+	rc = kernel_thread(cifs_oplock_thread, NULL, CLONE_FS | CLONE_FILES | CLONE_VM);
+	if (!rc) {
+		printk(KERN_ERR "Couldn't spawn cifs thread, error code = %d\n.", rc);
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



--===============47688355819745865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47688355819745865==--
