From: walter harms <wharms@bfs.de>
Date: Mon, 20 Dec 2004 13:07:01 +0000
Subject: [KJ] linux-2.6.9/fs/proc/proc_tty.c: avoid array
Message-Id: <200412201407.01506.wharms@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============019423970113759514=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============019423970113759514==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi list,
no need for an array here.  therefor no need to worry about possible 
overflows. seq_printf() can handle this.

avoid array in show_tty_range()

re,
walter

signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.9/fs/proc/proc_tty.c.bak	2004-12-18 22:15:37.000000000 +0100
+++ linux-2.6.9/fs/proc/proc_tty.c	2004-12-18 22:18:33.000000000 +0100
@@ -32,10 +32,8 @@
 	seq_printf(m, "%-20s ", p->driver_name ? p->driver_name : "unknown");
 	seq_printf(m, "/dev/%-8s ", p->name);
 	if (p->num > 1) {
-		char	range[20];
-		sprintf(range, "%d-%d", MINOR(from),
+		seq_printf(m, "%3d %d-%d ", MAJOR(from), MINOR(from),
 			MINOR(from) + num - 1);
-		seq_printf(m, "%3d %7s ", MAJOR(from), range);
 	} else {
 		seq_printf(m, "%3d %7d ", MAJOR(from), MINOR(from));
 	}

--===============019423970113759514==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============019423970113759514==--
