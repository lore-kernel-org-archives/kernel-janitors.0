From: MJK <mkemp@cs.nmsu.edu>
Date: Fri, 28 May 2004 04:07:24 +0000
Subject: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405272203550.26922@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86407876365917069=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============86407876365917069==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Took suggestions (Thanks Randy, Mark!). I also noticed that else
where in aac_rx_init() there are error returns but no iounmapping. Should
I also fix that behavior?

	Signed-off-by: MJK <mkemp@cs.nmsu.edu>

Cordially,
M. Kemp

--- old.linux-2.6.7-rc1/drivers/scsi/aacraid/rx.c	2004-05-09 20:33:22.000000000 -0600
+++ new.linux-2.6.7-rc1/drivers/scsi/aacraid/rx.c	2004-05-27 21:42:40.283536451 -0600
@@ -435,6 +435,13 @@
 	 *	Start any kernel threads needed
 	 */
 	dev->thread_pid = kernel_thread((int (*)(void *))aac_command_thread, dev, 0);
+	if (dev->thread_pid < 0) {
+		printk(KERN_ERR "aacraid: unable to create i960 command thread.\n");
+		free_irq(dev->scsi_host_ptr->irq, (void *)dev);
+		kfree(dev->queues);
+		iounmap(dev->regs.rx);
+		return -1;
+	}
 	/*
 	 *	Tell the adapter that all is configured, and it can start
 	 *	accepting requests


--===============86407876365917069==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86407876365917069==--
