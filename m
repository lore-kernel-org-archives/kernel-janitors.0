From: MJK <mkemp@cs.nmsu.edu>
Date: Sat, 29 May 2004 04:34:58 +0000
Subject: [Kernel-janitors] [PATCH] rediff of kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405282233190.700@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75125973523413592=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75125973523413592==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Compiles, taken suggestions by Randy.

Signed-off-by: MJK <mkemp@cs.nmsu.edu>

Cordially,
M. Kemp

--- old.linux-2.6.7-rc1/drivers/scsi/aacraid/rx.c	2004-05-09 20:33:22.000000000 -0600
+++ new.linux-2.6.7-rc1/drivers/scsi/aacraid/rx.c	2004-05-28 22:20:21.039734696 -0600
@@ -390,14 +390,14 @@
 	 */
 	if (rx_readl(dev, IndexRegs.Mailbox[7]) & SELF_TEST_FAILED) {
 		printk(KERN_ERR "%s%d: adapter self-test failed.\n", dev->name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Check to see if the board panic'd while booting.
 	 */
 	if (rx_readl(dev, IndexRegs.Mailbox[7]) & KERNEL_PANIC) {
 		printk(KERN_ERR "%s%d: adapter kernel panic'd.\n", dev->name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	start = jiffies;
 	/*
@@ -409,7 +409,7 @@
 		{
 			status = rx_readl(dev, IndexRegs.Mailbox[7]) >> 16;
 			printk(KERN_ERR "%s%d: adapter kernel failed to start, init status = %ld.\n", dev->name, instance, status);
-			return -1;
+			goto error_iounmap;
 		}
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
@@ -417,7 +417,7 @@
 	if (request_irq(dev->scsi_host_ptr->irq, aac_rx_intr, SA_SHIRQ|SA_INTERRUPT, "aacraid", (void *)dev)<0)
 	{
 		printk(KERN_ERR "%s%d: Interrupt unavailable.\n", name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Fill in the function dispatch table.
@@ -430,15 +430,30 @@
 	dev->a_ops.adapter_check_health = aac_rx_check_health;

 	if (aac_init_adapter(dev) == NULL)
-		return -1;
+		goto error_irq;
 	/*
 	 *	Start any kernel threads needed
 	 */
 	dev->thread_pid = kernel_thread((int (*)(void *))aac_command_thread, dev, 0);
+	if (dev->thread_pid < 0) {
+		printk(KERN_ERR "aacraid: unable to create i960 command thread.\n");
+		goto error_kfree;
+	}
 	/*
 	 *	Tell the adapter that all is configured, and it can start
 	 *	accepting requests
 	 */
 	aac_rx_start_adapter(dev);
 	return 0;
+
+error_kfree:
+	kfree(dev->queues);
+
+error_irq:
+	free_irq(dev->scsi_host_ptr->irq, (void *)dev);
+
+error_iounmap:
+	iounmap(dev->regs.rx);
+
+	return -1;
 }

--===============75125973523413592==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75125973523413592==--
