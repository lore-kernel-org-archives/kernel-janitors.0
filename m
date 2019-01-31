From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 31 Jan 2019 20:46:55 +0000
Subject: Re: About swapoff race patch  (was Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NU
Message-Id: <20190131124655.96af1eb7e2f7bb0905527872@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
	<20190115002305.15402-1-daniel.m.jordan@oracle.com>
	<20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
	<87tvhpy22q.fsf_-_@yhuang-dev.intel.com>
In-Reply-To: <87tvhpy22q.fsf_-_@yhuang-dev.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Huang, Ying" <ying.huang@intel.com>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, shli@kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, will.deacon@arm.com

On Thu, 31 Jan 2019 10:48:29 +0800 "Huang\, Ying" <ying.huang@intel.com> wrote:

> Andrew Morton <akpm@linux-foundation.org> writes:
> > mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch is very
> > stuck so can you please redo this against mainline?
> 
> Allow me to be off topic, this patch has been in mm tree for quite some
> time, what can I do to help this be merged upstream?

I have no evidence that it has been reviewed, for a start.  I've asked
Hugh to look at it.
