From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:49:34 +0000
Subject: [KJ] [PATCH 1/] init/do_mounts_initrd.c: fix sparse warning
Message-Id: <200503100122.28432.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10383625373781769=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10383625373781769==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk1-sparse/init/do_mounts_initrd.c
===================================================================
--- linux-2.6.11-bk1-sparse.orig/init/do_mounts_initrd.c	2005-03-02 09:37:48.000000000 +0200
+++ linux-2.6.11-bk1-sparse/init/do_mounts_initrd.c	2005-03-06 03:12:08.000000000 +0200
@@ -41,7 +41,7 @@ static int __init do_linuxrc(void * shel
 static void __init handle_initrd(void)
 {
 	int error;
-	int i, pid;
+	int pid;
 
 	real_root_dev = new_encode_dev(ROOT_DEV);
 	create_dev("/dev/root.old", Root_RAM0, NULL);
@@ -58,7 +58,7 @@ static void __init handle_initrd(void)
 
 	pid = kernel_thread(do_linuxrc, "/linuxrc", SIGCHLD);
 	if (pid > 0) {
-		while (pid != sys_wait4(-1, &i, 0, NULL))
+		while (pid != sys_wait4(-1, NULL, 0, NULL))
 			yield();
 	}
 

--===============10383625373781769==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10383625373781769==--
