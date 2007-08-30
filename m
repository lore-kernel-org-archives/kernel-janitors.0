From: Russell King <rmk+lkml@arm.linux.org.uk>
Date: Thu, 30 Aug 2007 12:22:37 +0000
Subject: Re: [KJ][patch 3/3] VIDC20: use abs() from kernel.h instead of own definition
Message-Id: <20070830122237.GE10088@flint.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070830102551.131398783@finow14.de> <20070830104038.GD14925@ahaupt-debian-vm.localdomain> <20070830111746.GS14130@parisc-linux.org> <20070830115059.GA17168@ahaupt-debian-vm.localdomain>
In-Reply-To: <20070830115059.GA17168@ahaupt-debian-vm.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Haupt <andre@finow14.de>
Cc: Matthew Wilcox <matthew@wil.cx>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 30, 2007 at 01:50:59PM +0200, Andre Haupt wrote:
> On Thu, Aug 30, 2007 at 05:17:47AM -0600, Matthew Wilcox wrote:
> > On Thu, Aug 30, 2007 at 12:40:38PM +0200, andre@finow14.de wrote:
> > > -		diff_int = my_abs(rate_ext-rate);
> > > -		diff_ext = my_abs(rate_int-rate);
> > > +		diff_int = abs(rate_ext-rate);
> > > +		diff_ext = abs(rate_int-rate);
> > 
> > Nothing to do with the patch, but is this really correct?  Surely it
> > should be diff_ext = abs(rate_ext-rate) ?
> 
> hmmh, not sure about this ...

No idea.  The support for external clocking came from someone else
(I was never able to work it out myself).

I can only assume that the code as it stands does work.  So let's
remain bug-compatible until there's a proven problem.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
