From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 14 Oct 2006 18:50:22 +0000
Subject: Re: [KJ] [PATCH] drivers/char/riscom8.c:
Message-Id: <20061014185022.GO11633@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160739628.19143.376.camel@amol.verismonetworks.com> <1160835602.5732.30.camel@localhost.localdomain> <20061014174936.GN11633@parisc-linux.org> <1160851280.5732.34.camel@localhost.localdomain>
In-Reply-To: <1160851280.5732.34.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Amol Lad <amol@verismonetworks.com>, kernel Janitors <kernel-janitors@lists.osdl.org>, linux kernel <linux-kernel@vger.kernel.org>

On Sat, Oct 14, 2006 at 07:41:20PM +0100, Alan Cox wrote:
> Ar Sad, 2006-10-14 am 11:49 -0600, ysgrifennodd Matthew Wilcox:
> > Only broken on SMP ...
> > 
> > I wouldn't mind writing a new driver (using the serial core) if someone
> > wants to send me one.  I need a multiport serial card anyway ...
> 
> You still have ISA bus ?

Oh ... well ... not really.  My only remaining ISA motherboard was a
casualty of my last move (15 months ago).  I have a pair of PA-RISC
machines with EISA slots, but if this thing does DMA, I have to track
down some docs and write some code to get that working.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
