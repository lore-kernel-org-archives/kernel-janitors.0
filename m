From: MJK <mkemp@cs.nmsu.edu>
Date: Sat, 29 May 2004 04:37:19 +0000
Subject: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405282235000.700@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40841734133920182=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============40841734133920182==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hola!

	Compiles fine, took Randy's suggestions.

	Signed-off-by: MJK <mkemp@cs.nmsu.edu>

Goodnight,
M. Kemp

--- old.linux-2.6.7-rc1/drivers/scsi/aacraid/sa.c	2004-05-09 20:32:39.000000000 -0600
+++ new.linux-2.6.7-rc1/drivers/scsi/aacraid/sa.c	2004-05-28 22:22:00.614200814 -0600
@@ -362,21 +362,21 @@
 	if((dev->regs.sa = (struct sa_registers *)ioremap((unsigned long)dev->scsi_host_ptr->base, 8192))==NULL)
 	{
 		printk(KERN_WARNING "aacraid: unable to map ARM.\n" );
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Check to see if the board failed any self tests.
 	 */
 	if (sa_readl(dev, Mailbox7) & SELF_TEST_FAILED) {
 		printk(KERN_WARNING "%s%d: adapter self-test failed.\n", name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Check to see if the board panic'd while booting.
 	 */
 	if (sa_readl(dev, Mailbox7) & KERNEL_PANIC) {
 		printk(KERN_WARNING "%s%d: adapter kernel panic'd.\n", name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	start = jiffies;
 	/*
@@ -386,7 +386,7 @@
 		if (time_after(jiffies, start+180*HZ)) {
 			status = sa_readl(dev, Mailbox7) >> 16;
 			printk(KERN_WARNING "%s%d: adapter kernel failed to start, init status = %d.\n", name, instance, le32_to_cpu(status));
-			return -1;
+			goto error_iounmap;
 		}
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
@@ -395,7 +395,7 @@
 	dprintk(("ATIRQ\n"));
 	if (request_irq(dev->scsi_host_ptr->irq, aac_sa_intr, SA_SHIRQ|SA_INTERRUPT, "aacraid", (void *)dev ) < 0) {
 		printk(KERN_WARNING "%s%d: Interrupt unavailable.\n", name, instance);
-		return -1;
+		goto error_iounmap;
 	}

 	/*
@@ -411,14 +411,18 @@

 	dprintk(("FUNCDONE\n"));

-	if(aac_init_adapter(dev) == NULL)
-		return -1;
+	if (aac_init_adapter(dev) == NULL) {
+		goto error_irq;
+	}

 	dprintk(("NEWADAPTDONE\n"));
 	/*
 	 *	Start any kernel threads needed
 	 */
 	dev->thread_pid = kernel_thread((int (*)(void *))aac_command_thread, dev, 0);
+	if (dev->thread_pid < 0) {
+		goto error_kfree;
+	}
 	/*
 	 *	Tell the adapter that all is configure, and it can start
 	 *	accepting requests
@@ -427,5 +431,17 @@
 	aac_sa_start_adapter(dev);
 	dprintk(("STARTED\n"));
 	return 0;
+
+
+error_kfree:
+	kfree(dev->queues);
+
+error_irq:
+	free_irq(dev->scsi_host_ptr->irq, (void *)dev);
+
+error_iounmap:
+	iounmap(dev->regs.sa);
+
+	return -1;
 }


--===============40841734133920182==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40841734133920182==--
