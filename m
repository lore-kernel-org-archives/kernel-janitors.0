From: Timmy Yee <shoujun@masterofpi.org>
Date: Mon, 19 Jan 2004 03:48:53 +0000
Subject: [Kernel-janitors] [PATCH] fix kmalloc() in aha1542.c
Message-Id: <20040119034853.GA15426@masterofpi.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

In drivers/scsi/aha1542.c, kmalloc() is called with no memtype (i.e.
without some flag like GFP_KERNEL). The following patch will fix that.

--- linux-2.6.1/drivers/scsi/aha1542.c	2003-08-09 18:19:18.000000000 -0700
+++ linux-2.6.1-mpi/drivers/scsi/aha1542.c	2004-01-18 19:20:38.000000000 -0800
@@ -704,7 +704,7 @@
 #endif
 		int i;
 		ccb[mbo].op = 2;	/* SCSI Initiator Command  w/scatter-gather */
-		SCpnt->host_scribble = (unsigned char *) kmalloc(512, GFP_DMA);
+		SCpnt->host_scribble = (unsigned char *) kmalloc(512, GFP_KERNEL | GFP_DMA);
 		sgpnt = (struct scatterlist *) SCpnt->request_buffer;
 		cptr = (struct chain *) SCpnt->host_scribble;
 		if (cptr = NULL)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
