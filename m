From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 21 Jan 2004 19:49:40 +0000
Subject: Re: [Kernel-janitors] [PATCH] change kmalloc() auditing in aha1542.c
Message-Id: <20040121114940.7ba5d8a4.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040121033214.GA1414@masterofpi.org>
In-Reply-To: <20040121033214.GA1414@masterofpi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 20 Jan 2004 19:32:14 -0800 Timmy Yee <shoujun@masterofpi.org> wrote:

| Hi,
| 
| The aha1542 driver calls panic() if kmalloc() fails, which it shouldn't
| do. This patch changes that by having the code return a nonzero value, so
| it tells the SCSI mid-layer to retry the command, as suggested by Randy.
| 
| --- linux-2.6.1/drivers/scsi/aha1542.c	2003-08-09 18:19:18.000000000 -0700
| +++ linux-2.6.1-mpi/drivers/scsi/aha1542.c	2004-01-20 19:12:07.000000000 -0800
| @@ -708,7 +708,7 @@
|  		sgpnt = (struct scatterlist *) SCpnt->request_buffer;
|  		cptr = (struct chain *) SCpnt->host_scribble;
|  		if (cptr = NULL)
| -			panic("aha1542.c: unable to allocate DMA memory\n");
| +			return -ENOMEM;
|  		for (i = 0; i < SCpnt->use_sg; i++) {
|  			if (sgpnt[i].length = 0 || SCpnt->use_sg > 16 ||
|  			    (((int) sgpnt[i].offset) & 1) || (sgpnt[i].length & 1)) {
| _______________________________________________


I think that this is OK (after changing it to return 1;).
I was checking on whether the mailbox that is being used <mbo>
needs to be returned (unallocated, unreserved) here or not,
but I don't see a problem..  Did anyone else check this?

Thanks,
--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
