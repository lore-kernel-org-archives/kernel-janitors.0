From: MJK <mkemp@cs.nmsu.edu>
Date: Fri, 21 May 2004 02:50:44 +0000
Subject: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16547055883234263=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16547055883234263==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	I made sure that this wasn't one that Mr. Walter Harms didn't
graciously already do or wasn't in the new source tree.

--- old.linux-2.6.6/drivers/scsi/aacraid/rx.c	2004-05-09 20:33:22.000000000 -0600
+++ new.linux-2.6.6/drivers/scsi/aacraid/rx.c	2004-05-20 20:40:32.000000000 -0600
@@ -435,6 +435,11 @@
 	 *	Start any kernel threads needed
 	 */
 	dev->thread_pid = kernel_thread((int (*)(void *))aac_command_thread, dev, 0);
+	if (dev->thread_pid < 0) {
+		printk(KERN_ERR "aacraid: unable to create i960 command thread.\n");
+		return -1;
+	}
+
 	/*
 	 *	Tell the adapter that all is configured, and it can start
 	 *	accepting requests


--===============16547055883234263==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16547055883234263==--
