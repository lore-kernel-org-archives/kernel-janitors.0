From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 10 Apr 2015 05:34:31 +0000
Subject: Re: TODO list
Message-Id: <alpine.DEB.2.02.1504100733220.2016@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714100136.GA3583@albatros>
In-Reply-To: <20100714100136.GA3583@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Thu, 9 Apr 2015, Ravi Kerur wrote:

> 
> 
> On 4/9/2015 1:48 AM, Dan Carpenter wrote:
> > On Wed, Apr 08, 2015 at 05:36:01PM -0700, Ravi Kerur wrote:
> >>
> >>
> >> On 4/7/2015 12:49 AM, Dan Carpenter wrote:
> >>> On Fri, Apr 03, 2015 at 01:40:35PM -0700, Ravi Kerur wrote:
> >>>> Team,
> >>>>
> >>>> I am planning to take up following items from TODO list. If it's already picked please let me know. 
> >>>>
> >>>> * pci_set_dma_mask() and friends should use DMA_BIT_MASK(nn) instead of
> >>>>
> >>>> DMA_nnBIT_MASK or 0xffff... This is not 2.4 compatible, so beware of drivers with same code. [D: http://marc.theaimsgroup.com/?t8001993000001] Don't forget to #include dma-mapping.h
> >>>>
> >>>> * check kmallocs for things like GFP_DMA without a memtype. 
> >>>>
> >>>
> >>> The TODO is desperately out of date.  No one cares about 2.4 at all.
> >>> These days we don't really allow drivers to have backwards compatability
> >>> code so they compile on old kernels.  That stuff has to be stored out of
> >>> the main kernel tree.  We also have the compat-wireless and other
> >>> similar ways of backporting drivers.
> >>
> >> Thanks Dan. Do you recommend anything else for contribution? I am not a
> >> newbie to kernel but never contributed to kernel before so any inputs
> >> appreciated.
> > 
> > There is always stuff to fix in staging.  It's at all levels of
> > difficulty.
> 
> Can you please point me to the link or anything which lists what needs to be done. I can pick some of it.

You can run checkpatch, or other tools and fix the things that they 
highlight.  Once you start really looking at the code, you are likely to 
see other things that can be improved as well.  Some staging drivers also 
have TODO lists.

julia
