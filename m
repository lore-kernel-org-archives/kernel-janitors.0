From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 27 Sep 2006 22:58:36 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <9a8748490609271558y27c579dbt5a015e06044c06ba@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28/09/06, Dan Carpenter <error27@gmail.com> wrote:
> On 9/27/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> > On 27/09/06, Badari Pulavarty <pbadari@us.ibm.com> wrote:
> > > Hi,
> > >
> > > I started working on request_region() error handling fixes.
> > > Before I got too far, want to make sure its following approach
> > > is acceptable. (not happy with too many "goto" statements).
> > > Is there a better way to do this ?
> > >
> > > Please comment.
> > >
> > [snip]
> >
> > If you don't like all these goto's :
> >
> > > +       if (!request_region(0x20,0x20,"pic1")) {
> > > +               printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
> > > +               return;
> > > +       }
> > > +       if (!request_region(0xa0,0x20,"pic2")) {
> > > +               printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
> > > +               goto out5;
> > > +       }
> > > +       if (!request_region(0x00,0x20,"dma1")) {
> > > +               printk(KERN_WARNING"chrp_init: dma1 request region failed\n");
> > > +               goto out4;
> > > +       }
> > > +       if (!request_region(0x40,0x20,"timer")) {
> > > +               printk(KERN_WARNING"chrp_init: timer1 request region failed\n");
> > > +               goto out3;
> > > +       }
> > > +       if (!request_region(0x80,0x10,"dma page reg")) {
> > > +               printk(KERN_WARNING"chrp_init: dma page request region failed\n");
> > > +               goto out2;
> > > +       }
> > > +       if (!request_region(0xc0,0x20,"dma2")) {
> > > +               printk(KERN_WARNING"chrp_init: dma2 request region failed\n");
> > > +               goto out1;
> > > +       }
>
> I think that if any of those particular request_regions()s fail your
> system is unbootable.  Things like "timer1" seem pretty essential.
> The other solution is to just put a comment at the top that those
> always succeed so they don't need to be checked.
>

I don't think that's a good solution.
In some cases the regions may be essential and if one fails we've
lost, but in other cases the box may be slightly different and
actually be able to survive without.  With the vast proliferation of
different hardware out there can you really say for sure if some of
these regions will always be needed in every possible case?
In my opinion it's better to check them, do the right thing and
release if one request fails - then, if the box can't survive without,
checking has cost us nothing, it still won't work with or without the
check. But, if the box is able to survice without the regions, then
we've dont the right thing and stuff works.   Better safe than sorry.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
