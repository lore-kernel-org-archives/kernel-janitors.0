From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 28 May 2004 23:46:42 +0000
Subject: Re: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <20040528164642.43b73cba.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88283285085371377=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============88283285085371377==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 May 2004 22:07:24 -0600 (MDT) MJK wrote:

| 
| 	Took suggestions (Thanks Randy, Mark!). I also noticed that else
| where in aac_rx_init() there are error returns but no iounmapping. Should
| I also fix that behavior?

Yes.  Each return path needs to deallocate/free whatever has been
allocated up to that point.  However, don't duplicate code at
each return point.  At the first return point, use something like
'goto err_reason1;' and do whatever needs to be done there.
At the second return point, use 'goto err_reason2;' and do what
needs to be done there, and then fall thru to the <reason1> code.
(and use meaningful names for the reasons.)

There are plenty of examples of error-handling code like this if
you have problems with it.

Then after rx.c is done, rkt.c and sa.c need to the same treatments... :)


| 	Signed-off-by: MJK <mkemp@cs.nmsu.edu>
| 
| Cordially,
| M. Kemp
| 
| --- old.linux-2.6.7-rc1/drivers/scsi/aacraid/rx.c	2004-05-09 20:33:22.000000000 -0600
| +++ new.linux-2.6.7-rc1/drivers/scsi/aacraid/rx.c	2004-05-27 21:42:40.283536451 -0600
| @@ -435,6 +435,13 @@
|  	 *	Start any kernel threads needed
|  	 */
|  	dev->thread_pid = kernel_thread((int (*)(void *))aac_command_thread, dev, 0);
| +	if (dev->thread_pid < 0) {
| +		printk(KERN_ERR "aacraid: unable to create i960 command thread.\n");
| +		free_irq(dev->scsi_host_ptr->irq, (void *)dev);
| +		kfree(dev->queues);
| +		iounmap(dev->regs.rx);
| +		return -1;
| +	}
|  	/*
|  	 *	Tell the adapter that all is configured, and it can start
|  	 *	accepting requests
| 


--
~Randy

--===============88283285085371377==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88283285085371377==--
