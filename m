From: MJK <mkemp@cs.nmsu.edu>
Date: Sun, 06 Jun 2004 08:53:52 +0000
Subject: [Kernel-janitors] [REDIFF]
Message-Id: <Pine.LNX.4.58.0406060244001.19187@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============00080870641300645474=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============00080870641300645474==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Audited for kernel_thread() return values. Did it backwards last
time. *^_^*


--MJK

Description  : Audited for kernel_thread() return code in i2o_sys_init()

Signed-off-by: MJK <mkemp@cs.nmsu.edu>

--- old.linux-2.6.7-rc2/drivers/message/i2o/i2o_core.c	2004-06-02 02:58:02.000000000 -0600
+++ new.linux-2.6.7-rc2/drivers/message/i2o/i2o_core.c	2004-06-05 20:55:42.000000000 -0600
@@ -2233,7 +2233,13 @@

 		/* Create a kernel thread to deal with dynamic LCT updates */
 		iop->lct_pid = kernel_thread(i2o_dyn_lct, iop, CLONE_SIGHAND);
-
+
+		if (iop->lct_pid < 0) {
+			printk(KERN_ERR "Couldn't spawn thread for %s.\n", iop->name);
+			i2o_sys_shutdown();
+			return;
+		}
+
 		/* Update change ind on DLCT */
 		iop->dlct->change_ind = iop->lct->change_ind;


--===============00080870641300645474==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============00080870641300645474==--
