From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 12 Oct 2006 04:41:04 +0000
Subject: Re: [KJ] [PATCH 3/3] drivers/scsi/NCR5380.c: Replacing yield() with
Message-Id: <1160627344.19143.351.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160571242.19143.320.camel@amol.verismonetworks.com>
	 <1160589175.16513.58.camel@localhost.localdomain>
In-Reply-To: <1160589175.16513.58.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux kernel <linux-kernel@vger.kernel.org>, James.Bottomley@steeleye.com, kernel Janitors <kernel-janitors@lists.osdl.org>


> You want cond_resched() for this driver as its polling the hardware for
> a change that should occur very soon. (Actually you want to throw the
> hardware in the bin)
> 

Replaced schedule_timeout_interruptible() with cond_resched()

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/scsi/NCR5380.c linux-2.6.19-rc1/drivers/scsi/NCR5380.c
--- linux-2.6.19-rc1-orig/drivers/scsi/NCR5380.c	2006-09-21 10:15:39.000000000 +0530
+++ linux-2.6.19-rc1/drivers/scsi/NCR5380.c	2006-10-11 17:57:02.000000000 +0530
@@ -347,7 +347,7 @@ static int NCR5380_poll_politely(struct 
 		if((r & bit) = val)
 			return 0;
 		if(!in_interrupt())
-			yield();
+			cond_resched();
 		else
 			cpu_relax();
 	}


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
