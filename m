From: MJK <mkemp@cs.nmsu.edu>
Date: Sun, 06 Jun 2004 03:25:47 +0000
Subject: [Kernel-janitors] [PATCH]
Message-Id: <Pine.LNX.4.58.0406052118390.17753@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33358419602886036=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33358419602886036==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	So, I'm wondering if this is the best choice or not. Shutting down
the whole i2o system because we can't spawn a kernel thread may not be
totally fair to the other IOP's. Then again, if we can't spawn a kernel
thread we probably have other, bigger things to worry about.
	Opinions?

--MJK

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Description: Audited kernel_thread() in i2o_core_init().

	Signed-off-by: MJK <mkemp@cs.nmsu.edu>

--- new.linux-2.6.7-rc2/drivers/message/i2o/i2o_core.c	2004-06-05 20:55:42.798577880 -0600
+++ old.linux-2.6.7-rc2/drivers/message/i2o/i2o_core.c	2004-06-02 02:58:02.000000000 -0600
@@ -2233,13 +2233,7 @@

 		/* Create a kernel thread to deal with dynamic LCT updates */
 		iop->lct_pid = kernel_thread(i2o_dyn_lct, iop, CLONE_SIGHAND);
-
-		if (iop->lct_pid < 0) {
-			printk(KERN_ERR "Couldn't spawn thread for %s.\n", iop->name);
-			i2o_sys_shutdown();
-			return;
-		}
-
+
 		/* Update change ind on DLCT */
 		iop->dlct->change_ind = iop->lct->change_ind;


--===============33358419602886036==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33358419602886036==--
