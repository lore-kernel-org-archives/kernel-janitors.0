From: MJK <mkemp@cs.nmsu.edu>
Date: Sat, 29 May 2004 04:39:23 +0000
Subject: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405282237210.700@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93092711880908752=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============93092711880908752==
Content-Type: TEXT/PLAIN; charset=US-ASCII



	Compiles fine, took Randy's advice.

Sweet cuppin-cakes!
M. Kemp

--- old.linux-2.6.7-rc1/drivers/scsi/aacraid/rkt.c	2004-05-09 20:33:13.000000000 -0600
+++ new.linux-2.6.7-rc1/drivers/scsi/aacraid/rkt.c	2004-05-28 22:28:13.011947990 -0600
@@ -383,21 +383,21 @@
 	if((dev->regs.rkt = (struct rkt_registers *)ioremap((unsigned long)dev->scsi_host_ptr->base, 8192))==NULL)
 	{
 		printk(KERN_WARNING "aacraid: unable to map i960.\n" );
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Check to see if the board failed any self tests.
 	 */
 	if (rkt_readl(dev, IndexRegs.Mailbox[7]) & SELF_TEST_FAILED) {
 		printk(KERN_ERR "%s%d: adapter self-test failed.\n", dev->name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Check to see if the board panic'd while booting.
 	 */
 	if (rkt_readl(dev, IndexRegs.Mailbox[7]) & KERNEL_PANIC) {
 		printk(KERN_ERR "%s%d: adapter kernel panic'd.\n", dev->name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	start = jiffies;
 	/*
@@ -409,7 +409,7 @@
 		{
 			status = rkt_readl(dev, IndexRegs.Mailbox[7]) >> 16;
 			printk(KERN_ERR "%s%d: adapter kernel failed to start, init status = %ld.\n", dev->name, instance, status);
-			return -1;
+			goto error_iounmap;
 		}
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
@@ -417,7 +417,7 @@
 	if (request_irq(dev->scsi_host_ptr->irq, aac_rkt_intr, SA_SHIRQ|SA_INTERRUPT, "aacraid", (void *)dev)<0)
 	{
 		printk(KERN_ERR "%s%d: Interrupt unavailable.\n", name, instance);
-		return -1;
+		goto error_iounmap;
 	}
 	/*
 	 *	Fill in the function dispatch table.
@@ -430,7 +430,7 @@
 	dev->a_ops.adapter_check_health = aac_rkt_check_health;

 	if (aac_init_adapter(dev) == NULL)
-		return -1;
+		goto error_irq;
 	/*
 	 *	Start any kernel threads needed
 	 */
@@ -438,7 +438,7 @@
 	if(dev->thread_pid < 0)
 	{
 		printk(KERN_ERR "aacraid: Unable to create rkt thread.\n");
-		return -1;
+		goto error_kfree;
 	}
 	/*
 	 *	Tell the adapter that all is configured, and it can start
@@ -446,4 +446,15 @@
 	 */
 	aac_rkt_start_adapter(dev);
 	return 0;
+
+error_kfree:
+	kfree(dev->queues);
+
+error_irq:
+	free_irq(dev->scsi_host_ptr->irq, (void *)dev);
+
+error_iounmap:
+	iounmap(dev->regs.rkt);
+
+	return -1;
 }

--===============93092711880908752==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93092711880908752==--
