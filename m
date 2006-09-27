From: "Dan Carpenter" <error27@gmail.com>
Date: Wed, 27 Sep 2006 22:45:55 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <a63d67fe0609271545v249549e9x6c64c4259564218f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 9/27/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> On 27/09/06, Badari Pulavarty <pbadari@us.ibm.com> wrote:
> > Hi,
> >
> > I started working on request_region() error handling fixes.
> > Before I got too far, want to make sure its following approach
> > is acceptable. (not happy with too many "goto" statements).
> > Is there a better way to do this ?
> >
> > Please comment.
> >
> [snip]
>
> If you don't like all these goto's :
>
> > +       if (!request_region(0x20,0x20,"pic1")) {
> > +               printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
> > +               return;
> > +       }
> > +       if (!request_region(0xa0,0x20,"pic2")) {
> > +               printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
> > +               goto out5;
> > +       }
> > +       if (!request_region(0x00,0x20,"dma1")) {
> > +               printk(KERN_WARNING"chrp_init: dma1 request region failed\n");
> > +               goto out4;
> > +       }
> > +       if (!request_region(0x40,0x20,"timer")) {
> > +               printk(KERN_WARNING"chrp_init: timer1 request region failed\n");
> > +               goto out3;
> > +       }
> > +       if (!request_region(0x80,0x10,"dma page reg")) {
> > +               printk(KERN_WARNING"chrp_init: dma page request region failed\n");
> > +               goto out2;
> > +       }
> > +       if (!request_region(0xc0,0x20,"dma2")) {
> > +               printk(KERN_WARNING"chrp_init: dma2 request region failed\n");
> > +               goto out1;
> > +       }

I think that if any of those particular request_regions()s fail your
system is unbootable.  Things like "timer1" seem pretty essential.
The other solution is to just put a comment at the top that those
always succeed so they don't need to be checked.

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
