From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 15 Aug 2012 14:50:26 +0000
Subject: Re: [staging:staging-next 70/73] drivers/staging/comedi/drivers/amplc_dio200.c:1444:2: error: implic
Message-Id: <20120815145026.GA429@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502B71C7.4010005@mev.co.uk>
In-Reply-To: <502B71C7.4010005@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 15, 2012 at 07:47:01AM -0700, Greg KH wrote:
> On Wed, Aug 15, 2012 at 10:35:05PM +0800, Fengguang Wu wrote:
> > > Wait, what do you mean by "non-rebaseable"?  I think you mean
> > > "non-bisectable" right?
> > 
> > I mean, the branch will not be rebased to fixup errors in the middle.
> > Like the Linus' tree, and the tip/net trees.  For these branches that
> > cannot afford to rebase, bug fixes always get appended rather than get
> > folded into the buggy commit.
> > 
> > For the non-rebaseable branches, I'll first build test the branch HEAD,
> > and iff it has build errors, go back to locate the first commit that
> > introduces the errors. This way, it can avoid sending out pointless
> > warnings about known bugs that are eventually fixed up in the HEAD.
> 
> None of my trees and branches should ever be rebased, unless something
> really wrong goes on.  I think I've only had to ever do this once, for
> one branch, in the past years that I've been doing this.

Got it, thanks!

Thanks,
Fengguang
