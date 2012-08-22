From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Wed, 22 Aug 2012 06:46:35 +0000
Subject: Re: [PATCH] drivers/dma/sirf-dma.c: fix usage of devm functions
Message-Id: <1345617275.1895.83.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344069330-29569-1-git-send-email-Julia.Lawall@lip6.fr>
 <1345608994.1895.73.camel@vkoul-udesk3>
 <CAGsJ_4yjzE3eNGz=AA7gGxGNkjBH8bKRAUsYXcG+A1p8PtOQPw@mail.gmail.com>
 <alpine.DEB.2.02.1208220729440.1966@localhost6.localdomain6>
 <CAGsJ_4wkyY7VkrgMwGwmFF4kpGiGEtU8Ox46G-yOspAi27Lqgg@mail.gmail.com>
In-Reply-To: <CAGsJ_4wkyY7VkrgMwGwmFF4kpGiGEtU8Ox46G-yOspAi27Lqgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, 2012-08-22 at 13:41 +0800, Barry Song wrote:
> >>
> >>
> >> the git log "drivers/dma/sirf-dma.c: fix usage of devm functions"
> >> should be fixed.
> >
> >
> > What do you suggest?  The patch is about problems with the use of
> > devm_kzalloc, devm_ioremap, and devm_request_irq.
> 
> i mean the prefix
> 
> dmaengine: sirf: .............
That is the usual way, it helps if you see the notation used by
subsystem by checking patches being sent to subsystem, but it is not a
really big deal, pls take care of this in future.


-- 
~Vinod

