From: walter harms <wharms@bfs.de>
Date: Sat, 27 Nov 2004 16:26:16 +0000
Subject: [KJ] kernel-2.6.9: make sock_init() notice errors
Message-Id: <41A8AAA8.6070905@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28748477936302219=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28748477936302219==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,
by accident i found that that sock_init never checks the return code of
called init functions. I have no idea why this is not done so i added
only a printk() to inform the user about the problem.
The function returns no error indicator. i left it this way.

re,
walter


Signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.9/net/socket.c.bak	2004-11-26 23:55:03.000000000 +0100
+++ linux-2.6.9/net/socket.c	2004-11-27 00:21:25.000000000 +0100
@@ -2032,6 +2032,7 @@
  void __init sock_init(void)
  {
  	int i;
+	int ret;

  	/*
  	 *	Initialize all address (protocol) families.
@@ -2057,9 +2058,26 @@
  	 *	Initialize the protocols module.
  	 */

-	init_inodecache();
-	register_filesystem(&sock_fs_type);
+	ret=init_inodecache();
+	if ( ret < 0 ) {
+		printk(KERN_CRIT "%s : init_inodecache failed\n",__FUNCTION__);
+		return;
+	}
+
+	ret=register_filesystem(&sock_fs_type);
+
+	if ( ret < 0 ) {
+		printk(KERN_CRIT "%s : can not register sock_fs\n",__FUNCTION__);
+		return;
+	}
+
+
  	sock_mnt = kern_mount(&sock_fs_type);
+	if (IS_ERR(sock_mnt)) {
+		printk(KERN_CRIT "%s : can not mount sock_fs\n",__FUNCTION__);
+		return;
+	}
+
  	/* The real protocol initialization is performed when
  	 *  do_initcalls is run.
  	 */

--===============28748477936302219==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28748477936302219==--
