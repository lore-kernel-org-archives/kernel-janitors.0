From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 15 Aug 2012 14:35:05 +0000
Subject: Re: [staging:staging-next 70/73] drivers/staging/comedi/drivers/amplc_dio200.c:1444:2: error: implic
Message-Id: <20120815143505.GA32574@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502B71C7.4010005@mev.co.uk>
In-Reply-To: <502B71C7.4010005@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 15, 2012 at 07:10:01AM -0700, Greg KH wrote:
> On Wed, Aug 15, 2012 at 10:07:36PM +0800, Fengguang Wu wrote:
> > > > Well it looks like my patches got applied in the wrong order (1, 3,
> > > > 2) on Greg's staging-next branch, but as long as all 3 patches are
> > > > applied it ought to compile okay.
> > > 
> > > Argh, I did?  Sorry about that.  Nothing I can do about it now :(
> > 
> > No problem. That reminds me to mark the staging-next branch as
> > non-rebaseable (which means the test system will silently ignore
> > intermediate errors in that branch).
> > 
> > Perhaps usb-next is non-rebaseable as well.
> 
> It shouldn't be, I hopefully do not mess up like this often.

OK. It's obvious to me that you have a good workflow and test system
to keep the error ratio extremely low.

> Wait, what do you mean by "non-rebaseable"?  I think you mean
> "non-bisectable" right?

I mean, the branch will not be rebased to fixup errors in the middle.
Like the Linus' tree, and the tip/net trees.  For these branches that
cannot afford to rebase, bug fixes always get appended rather than get
folded into the buggy commit.

For the non-rebaseable branches, I'll first build test the branch HEAD,
and iff it has build errors, go back to locate the first commit that
introduces the errors. This way, it can avoid sending out pointless
warnings about known bugs that are eventually fixed up in the HEAD.

Thanks,
Fengguang
