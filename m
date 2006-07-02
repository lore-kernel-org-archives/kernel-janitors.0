From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Sun, 02 Jul 2006 23:55:30 +0000
Subject: Re: [KJ] [PATCH 2] drivers/atm/idt77252.c: Fix more KERN_* in
Message-Id: <6b4e42d10607021643o6f788adaw68e3988d20c42d2d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A83604.5090700@chello.nl>
In-Reply-To: <44A83604.5090700@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/3/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> On Sun, Jul 02, 2006 at 11:09:24PM +0200, Richard wrote:
> > -                     printk("%s: raw cell %x.%02x.%04x.%x.%x\n",
> > +                     printk(KERN_DEBUG "%s: raw cell %x.%02x.%04x.%x.%x\n",
> >                              card->name, (header >> 28) & 0x000f,
> >                              (header >> 20) & 0x00ff,
> >                              (header >>  4) & 0xffff,
> >                              (header >>  1) & 0x0007,
> >                              (header >>  0) & 0x0001);
> >                       for (i = 16; i < 64; i++)
> > -                             printk(" %02x", queue->data[i]);
> > +                             printk("KERN_DEBUG %02x", queue->data[i]);
Shouldn't it be
            printk(KERN_DEBUG "%02x", queue->data[i]);
Note the `"`

Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
