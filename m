From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 21:02:43 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/message
Message-Id: <1141592563.17717.19.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============294849353472175=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============294849353472175==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/message/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/message/fusion/mptctl.c.orig	2006-03-05 16:03:30.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/message/fusion/mptctl.c	2006-03-05 16:04:18.000000000 +0100
@@ -962,10 +962,9 @@ kbuf_alloc_2_sgl(int bytes, u32 sgdir, i
 	 * structures for the SG elements.
 	 */
 	i = MAX_SGL_BYTES / 8;
-	buflist = kmalloc(i, GFP_USER);
+	buflist = kzalloc(i, GFP_USER);
 	if (buflist == NULL)
 		return NULL;
-	memset(buflist, 0, i);
 	buflist_ent = 0;
 
 	/* Allocate a single block of memory to store the sg elements and
@@ -1377,13 +1376,12 @@ mptctl_gettargetinfo (unsigned long arg)
 	 *      15- 8: Bus Number
 	 *       7- 0: Target ID
 	 */
-	pmem = kmalloc(numBytes, GFP_KERNEL);
+	pmem = kzalloc(numBytes, GFP_KERNEL);
 	if (pmem == NULL) {
 		printk(KERN_ERR "%s::mptctl_gettargetinfo() @%d - no memory available!\n",
 				__FILE__, __LINE__);
 		return -ENOMEM;
 	}
-	memset(pmem, 0, numBytes);
 	pdata =  (int *) pmem;
 
 	/* Get number of devices
@@ -1617,12 +1615,11 @@ mptctl_eventenable (unsigned long arg)
 		/* Have not yet allocated memory - do so now.
 		 */
 		int sz = MPTCTL_EVENT_LOG_SIZE * sizeof(MPT_IOCTL_EVENTS);
-		ioc->events = kmalloc(sz, GFP_KERNEL);
+		ioc->events = kzalloc(sz, GFP_KERNEL);
 		if (ioc->events == NULL) {
 			printk(KERN_ERR MYNAM ": ERROR - Insufficient memory to add adapter!\n");
 			return -ENOMEM;
 		}
-		memset(ioc->events, 0, sz);
 		ioc->alloc_total += sz;
 
 		ioc->eventContext = 0;
@@ -2888,13 +2885,12 @@ mptctl_probe(struct pci_dev *pdev, const
 	 * Allocate and inite a MPT_IOCTL structure
 	*/
 	sz = sizeof (MPT_IOCTL);
-	mem = kmalloc(sz, GFP_KERNEL);
+	mem = kzalloc(sz, GFP_KERNEL);
 	if (mem == NULL) {
 		err = -ENOMEM;
 		goto out_fail;
 	}
 
-	memset(mem, 0, sz);
 	ioc->ioctl = (MPT_IOCTL *) mem;
 	ioc->ioctl->ioc = ioc;
 	mutex_init(&ioc->ioctl->ioctl_mutex);



--===============294849353472175==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============294849353472175==--
