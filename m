From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 01 Jun 2013 23:06:12 +0000
Subject: Re: [PATCH] usb: musb: use the new %pa format specifier for dma_addr_t
Message-Id: <CA+0zTV-LtE0zZRBtOdqRm0bbT10XkGURvmddR6unWU0O0XutWQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370109747-18821-1-git-send-email-emilgoode@gmail.com>
	<1370111350.2098.1.camel@joe-AO722>
	<20130601190926.GA5541@debian>
	<1370118685.2098.7.camel@joe-AO722>
	<51AA6E1F.7080003@infradead.org>
	<1370124960.2098.9.camel@joe-AO722>
In-Reply-To: <1370124960.2098.9.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stepan Moskovchenko <stepanm@codeaurora.org>, balbi@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Joe and Randy,

Maybe there should be another format specifier %da and Randy's
clarifying comment
can be added there to the documentation?

Best regards,

Emil Goode

On Sat, Jun 01, 2013 at 03:16:00PM -0700, Joe Perches wrote:
> On Sat, 2013-06-01 at 14:56 -0700, Randy Dunlap wrote:
> > It's a bit of a shame that this
> > comment was deleted from include/asm-generic/types.h in commit
> > 3e50594e8e72932ad4cfcb0b3cbdf58fc3bce416:
> >
> > -/*
> > - * DMA addresses may be very different from physical addresses
> > - * and pointers. i386 and powerpc may have 64 bit DMA on 32 bit
> > - * systems, while sparc64 uses 32 bit DMA addresses for 64 bit
> > - * physical addresses.
> > - * This default defines dma_addr_t to have the same size as
> > - * phys_addr_t, which is the most common way.
> > - * Do not define the dma64_addr_t type, which never really
> > - * worked.
> > - */
>
> Hey Randy.
>
> You could always put it back.
>
>
