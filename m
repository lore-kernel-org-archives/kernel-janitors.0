From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sat, 14 Oct 2006 12:18:12 +0000
Subject: Re: [KJ] [PATCH] drivers/char/riscom8.c:
Message-Id: <1160828292.5732.2.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160739628.19143.376.camel@amol.verismonetworks.com>
	 <1160751657.25218.47.camel@localhost.localdomain>
	 <1160811574.19143.391.camel@amol.verismonetworks.com>
In-Reply-To: <1160811574.19143.391.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

Ar Sad, 2006-10-14 am 13:09 +0530, ysgrifennodd Amol Lad:
> On Fri, 2006-10-13 at 16:00 +0100, Alan Cox wrote:
> > Ar Gwe, 2006-10-13 am 17:10 +0530, ysgrifennodd Amol Lad:
> > > Removed save_flags()/cli()/sti() and used (light weight) spin locks
> > > 
> > 
> > Have you tested this and verified there are no recursive locking cases
> > in your changes ?
> 
> I doxygend riscom8.c and used call graphs to verify there are no
> recursive locks. I did a code review also

Thanks for the info. I'll give the code a second review (also not having
hardware) and then send you/Andrew either an Ack or corrections.

Alan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
