From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Thu, 28 Sep 2006 15:04:12 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <1159455853.1709.56.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> > > If you don't like all these goto's :
> > >
> > > > +       if (!request_region(0x20,0x20,"pic1")) {
> > > > +               printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
> > > > +               return;
> > > > +       }
> > > > +       if (!request_region(0xa0,0x20,"pic2")) {
> > > > +               printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
> > > > +               goto out5;
> > > > +       }
> > > > +       if (!request_region(0x00,0x20,"dma1")) {
> > > > +               printk(KERN_WARNING"chrp_init: dma1 request region failed\n");
> > > > +               goto out4;
> > > > +       }
> > > > +       if (!request_region(0x40,0x20,"timer")) {
> > > > +               printk(KERN_WARNING"chrp_init: timer1 request region failed\n");
> > > > +               goto out3;
> > > > +       }
> > > > +       if (!request_region(0x80,0x10,"dma page reg")) {
> > > > +               printk(KERN_WARNING"chrp_init: dma page request region failed\n");
> > > > +               goto out2;
> > > > +       }
> > > > +       if (!request_region(0xc0,0x20,"dma2")) {
> > > > +               printk(KERN_WARNING"chrp_init: dma2 request region failed\n");
> > > > +               goto out1;
> > > > +       }
> >

I see lot of places where we try acquire multiple regions, so all these
places need to handle errors and release already acquired ones properly.
I am just wondering, if we are better off introducing/requesting a new
interface like request_regions() and release_regions() which iterates
over a vector of requests and handles them properly ?

Thanks,
Badari

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
