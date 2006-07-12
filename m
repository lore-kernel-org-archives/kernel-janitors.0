From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 12 Jul 2006 14:58:41 +0000
Subject: Re: [KJ] [PATCH] Convert DPRINTK to pr_debug in drivers/scsi/ahci.c
Message-Id: <20060712075841.a411f246.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44B44D3A.8010101@gmail.com>
In-Reply-To: <44B44D3A.8010101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 12 Jul 2006 07:05:03 -0500 Matthew Martin wrote:

> Domen Puncer wrote:
> > On 11/07/06 20:15 -0500, Matthew Martin wrote:
> >   
> >> Hello,
> >>     This converts DPRINTK to pr_debug in drivers/scsi/ahci.c
> >>     
> >
> > If you look at libata.h, you see that DPRINTK also includes the
> > function name.
> >
> > Maybe it's better left as it is (it looks like it's a part of
> > libata api).
> >
> >
> > 	Domen
> >
> >   
> Then someone should take it off the Kernel Janitor TODO list...

It's also a good idea to ask before spending much time on
something (although this one wasn't "much" time).

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
