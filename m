From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 13 Jun 2007 13:14:55 +0000
Subject: Re: [KJ] [KJ PATCH] Replacing alloc_pages(gfp, 0) with alloc_page(gfp)
Message-Id: <Pine.LNX.4.64.0706130912080.4392@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181702562.2282.12.camel@shani-win>
 <a901b49a0706130312mba8a686m455b5cbf774cc159@mail.gmail.com>
In-Reply-To: <a901b49a0706130312mba8a686m455b5cbf774cc159@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: psr <pradeep.rautela@gmail.com>
Cc: Shani Moideen <shani.moideen@wipro.com>, netdev@vger.kernel.org, akpm@linux-foundation.org, jgarzik@pobox.com, kernel-janitors@lists.osdl.org

On Wed, 13 Jun 2007, psr wrote:

> On 6/13/07, Shani Moideen <shani.moideen@wipro.com> wrote:
> >
> > Replacing alloc_pages(gfp,0) with alloc_page(gfp)
> > in net/core/pktgen.c
> >
> > Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
> > ----
> >
> > diff --git a/net/core/pktgen.c b/net/core/pktgen.c
> > index b92a322..2600c7f 100644
> > --- a/net/core/pktgen.c
> > +++ b/net/core/pktgen.c
> > @@ -2414,7 +2414,7 @@ static struct sk_buff *fill_packet_ipv4(struct
> > net_device *odev,
> >
> >                 i = 0;
> >                 while (datalen > 0) {
> > -                       struct page *page = alloc_pages(GFP_KERNEL, 0);
> > +                       struct page *page = alloc_page(GFP_KERNEL);
>
> Does this makes any difference anyway? Both are same eventually?
> What is the rational behind this? Can you please help me
> understanding this?

since this is one of the TO DO items i added to the list of things at
the wiki:

http://fsdev.net/wiki/index.php?title=Memory_allocation_cleanup

i'll just toss in my $0.02.  if a short (more convenient) form of a
routine has been defined, it should be used.  if you have no plans to
use it, it shouldn't have been defined in the first place.

in short, make a consistent decision and go with it.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
