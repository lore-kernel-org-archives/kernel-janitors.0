From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 11 Oct 2006 17:52:55 +0000
Subject: Re: [KJ] [PATCH 3/3] drivers/scsi/NCR5380.c: Replacing yield() with
Message-Id: <1160589175.16513.58.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160571242.19143.320.camel@amol.verismonetworks.com>
In-Reply-To: <1160571242.19143.320.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, James.Bottomley@steeleye.com, kernel Janitors <kernel-janitors@lists.osdl.org>

Ar Mer, 2006-10-11 am 18:24 +0530, ysgrifennodd Amol Lad:
> For this driver schedule_timeout_schedule() seems to be a better
> alternative. 
> 
> *Please see if the function should be called with 1 jiffy delay or more
> is better*

You want cond_resched() for this driver as its polling the hardware for
a change that should occur very soon. (Actually you want to throw the
hardware in the bin)

Alan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
