From: walter harms <wharms@bfs.de>
Date: Mon, 20 Dec 2004 12:56:20 +0000
Subject: [KJ] inux-2.6.9/fs/proc/base.c: array size
Message-Id: <200412201356.20861.wharms@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74914121268630263=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74914121268630263==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi list,
i was looking for arrays (and possible overflows) when i noticed that
proc_pid_wchan() uses a 128-Byte array for something that can change its size
via define.

Fix possible overflow: rewrite arraysize with correct constant

re,
walter


signed-off-by: walter harms <wharms@bfs.de>


--- linux-2.6.9/fs/proc/base.c.bak	2004-12-18 21:13:31.000000000 +0100
+++ linux-2.6.9/fs/proc/base.c	2004-12-18 21:32:37.000000000 +0100
@@ -400,7 +400,7 @@
 	char *modname;
 	const char *sym_name;
 	unsigned long wchan, size, offset;
-	char namebuf[128];
+	char namebuf[KSYM_NAME_LEN+1];
 
 	wchan = get_wchan(task);
 

--===============74914121268630263==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74914121268630263==--
