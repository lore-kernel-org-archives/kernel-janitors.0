From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 25 May 2004 17:58:03 +0000
Subject: Re: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <20040525105803.59769aa8.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5735648749698643=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============5735648749698643==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 May 2004 20:50:44 -0600 (MDT) MJK wrote:

| 
| 	I made sure that this wasn't one that Mr. Walter Harms didn't
| graciously already do or wasn't in the new source tree.
| 
| --- old.linux-2.6.6/drivers/scsi/aacraid/rx.c	2004-05-09 20:33:22.000000000 -0600
| +++ new.linux-2.6.6/drivers/scsi/aacraid/rx.c	2004-05-20 20:40:32.000000000 -0600
| @@ -435,6 +435,11 @@
|  	 *	Start any kernel threads needed
|  	 */
|  	dev->thread_pid = kernel_thread((int (*)(void *))aac_command_thread, dev, 0);
| +	if (dev->thread_pid < 0) {
| +		printk(KERN_ERR "aacraid: unable to create i960 command thread.\n");
| +		return -1;
| +	}
| +
|  	/*
|  	 *	Tell the adapter that all is configured, and it can start
|  	 *	accepting requests

There are a few things that need to be undone if kernel_thread()
fails, before returning here:

a.  release the irq that request_irq() claimed;
b.  free the memory that aac_init_adapter() allocated (dev->queues);

--
~Randy

--===============5735648749698643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5735648749698643==--
