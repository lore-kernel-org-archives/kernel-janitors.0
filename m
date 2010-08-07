From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 07 Aug 2010 18:02:52 +0000
Subject: Re: [PATCH 01/18] char: moxa: call disable_pci_device() if
Message-Id: <20100807180251.GA2686@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281124152-12630-1-git-send-email-segooon@gmail.com>
 <20100807072205.GW9031@bicker>
 <20100807085512.GA5783@albatros>
 <20100807095852.GX9031@bicker>
In-Reply-To: <20100807095852.GX9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Rakib Mullick <rakib.mullick@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org

On Sat, Aug 07, 2010 at 11:58 +0200, Dan Carpenter wrote:
> On Sat, Aug 07, 2010 at 12:55:12PM +0400, Vasiliy Kulikov wrote:
> > On Sat, Aug 07, 2010 at 09:22 +0200, Dan Carpenter wrote:
> > > On Fri, Aug 06, 2010 at 11:49:10PM +0400, Kulikov Vasiliy wrote:
> > > > Driver should call disable_pci_device() if it returns from pci_probe()
> > > > with error. Also it must not be called if pci_request_region() fails as
> > > > it means that somebody uses device resources and rules the device.
> > > > 
> > > 
> > > I think we should disable it actually.  The comments on
> > > pci_enable_device() and pci_disable_device() say that only the first and
> > > last callers actually enable and disable it.  The others just increment
> > > or decrement a counter.
> > 
> > See this thread: http://lkml.org/lkml/2005/2/13/82
> > 
> > Specifically this mail:
> > 
> >     Date    Mon, 14 Feb 2005 14:51:26 -0500
> >     From    Jeff Garzik <>
> > 
> >     ...
> >     You also need to consider situations such as out-of-tree drivers 
> >     for the same hardware (might not use PCI API), and situations where you 
> >     have peer devices discovered and used (PCI API doesn't have "hey, <this> 
> >     device is associated with <current driver>, too" capability).
> >     ...
> > 
> > Searching for 'pci_disable_device() inurl:lkml' doesn't give me newer info
> > aboud this problem, so I think it's better to play safe.
> > 
> 
> That's ancient.  That's a couple months before the start of git.

Yes, but I can't find more recent answer to this question.
> 
> git show v2.6.12:drivers/pci/pci.c 
> 
> In those days pci_enable/disable_device() were not nestable.  These days
> we can just unwind normally so it's a big improvement.

The thing is not in that pci_enable_device() is nestable, but in that
some buggy non-mainline drivers may not use PCI api, but use
request_*(). In this case PCI bus doesn't see this driver and tries to
call mainline driver probe(). It sees that resources are already
grabbed. The only reason can be another driver that rules this device
(or our kernel is crazy). As we are robust driver we don't want to break
this buggy third party driver :-)

If you know better solution please tell me :-)

> 
> regards,
> dan carpenter
