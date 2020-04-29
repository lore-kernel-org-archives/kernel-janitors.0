From: Matthew Wilcox <willy@infradead.org>
Date: Wed, 29 Apr 2020 01:48:03 +0000
Subject: Re: [PATCH -next] ipc: use GFP_ATOMIC under spin lock
Message-Id: <20200429014803.GO29705@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428034736.27850-1-weiyongjun1@huawei.com>
 <20200428111403.GJ29705@bombadil.infradead.org>
 <20200428171420.045f0acc9e1bf20044c4560e@linux-foundation.org>
In-Reply-To: <20200428171420.045f0acc9e1bf20044c4560e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Waiman Long <longman@redhat.com>, Manfred Spraul <manfred@colorfullife.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Dobriyan <adobriyan@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 28, 2020 at 05:14:20PM -0700, Andrew Morton wrote:
> On Tue, 28 Apr 2020 04:14:03 -0700 Matthew Wilcox <willy@infradead.org> wrote:
> 
> > On Tue, Apr 28, 2020 at 03:47:36AM +0000, Wei Yongjun wrote:
> > > The function ipc_id_alloc() is called from ipc_addid(), in which
> > > a spin lock is held, so we should use GFP_ATOMIC instead.
> > > 
> > > Fixes: de5738d1c364 ("ipc: convert ipcs_idr to XArray")
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > 
> > I see why you think that, but it's not true.  Yes, we hold a spinlock, but
> > the spinlock is in an object which is not reachable from any other CPU.
> > So it's not possible to deadlock.
> 
> um, then why are we taking it?

The lock has to be held by the time 'new' is findable because 'new' is
not completely constructed at that point.  The finder will try to acquire
the spinlock before looking at the uninitialised fields, so it's safe.
But it's not a common idiom we use at all.

> >  This probably confuses all kinds
> > of automated checkers,
> 
> A big fat code comment would reduce the email traffic?

I think I can rewrite this to take the spinlock after doing the allocation.
