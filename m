From: Timmy Yee <shoujun@masterofpi.org>
Date: Wed, 21 Jan 2004 03:32:14 +0000
Subject: [Kernel-janitors] [PATCH] change kmalloc() auditing in aha1542.c
Message-Id: <20040121033214.GA1414@masterofpi.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

The aha1542 driver calls panic() if kmalloc() fails, which it shouldn't
do. This patch changes that by having the code return a nonzero value, so
it tells the SCSI mid-layer to retry the command, as suggested by Randy.

--- linux-2.6.1/drivers/scsi/aha1542.c	2003-08-09 18:19:18.000000000 -0700
+++ linux-2.6.1-mpi/drivers/scsi/aha1542.c	2004-01-20 19:12:07.000000000 -0800
@@ -708,7 +708,7 @@
 		sgpnt = (struct scatterlist *) SCpnt->request_buffer;
 		cptr = (struct chain *) SCpnt->host_scribble;
 		if (cptr = NULL)
-			panic("aha1542.c: unable to allocate DMA memory\n");
+			return -ENOMEM;
 		for (i = 0; i < SCpnt->use_sg; i++) {
 			if (sgpnt[i].length = 0 || SCpnt->use_sg > 16 ||
 			    (((int) sgpnt[i].offset) & 1) || (sgpnt[i].length & 1)) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
