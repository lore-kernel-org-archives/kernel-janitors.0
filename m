From: Matthew Wilcox <willy@infradead.org>
Date: Tue, 28 Apr 2020 11:14:03 +0000
Subject: Re: [PATCH -next] ipc: use GFP_ATOMIC under spin lock
Message-Id: <20200428111403.GJ29705@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428034736.27850-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428034736.27850-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Waiman Long <longman@redhat.com>, Manfred Spraul <manfred@colorfullife.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Dobriyan <adobriyan@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 28, 2020 at 03:47:36AM +0000, Wei Yongjun wrote:
> The function ipc_id_alloc() is called from ipc_addid(), in which
> a spin lock is held, so we should use GFP_ATOMIC instead.
> 
> Fixes: de5738d1c364 ("ipc: convert ipcs_idr to XArray")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I see why you think that, but it's not true.  Yes, we hold a spinlock, but
the spinlock is in an object which is not reachable from any other CPU.
So it's not possible to deadlock.  This probably confuses all kinds
of automated checkers, and I should probably rewrite the code to not
acquire the new spinlock until we're already holding the xa_lock.

Converting to GFP_ATOMIC is completely wrong.
