From: Hugh Dickins <hughd@google.com>
Date: Wed, 06 Feb 2019 00:36:35 +0000
Subject: Re: About swapoff race patch  (was Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NU
Message-Id: <alpine.LSU.2.11.1902051618320.10986@eggly.anvils>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com> <20190115002305.15402-1-daniel.m.jordan@oracle.com> <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org> <87tvhpy22q.fsf_-_@yhuang-dev.intel.com>
 <20190131124655.96af1eb7e2f7bb0905527872@linux-foundation.org> <alpine.LSU.2.11.1902041257390.4682@eggly.anvils> <878sytsrh0.fsf@yhuang-dev.intel.com>
In-Reply-To: <878sytsrh0.fsf@yhuang-dev.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Huang, Ying" <ying.huang@intel.com>
Cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Jordan <daniel.m.jordan@oracle.com>, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, willy@infradead.org, will.deacon@arm.com

On Wed, 6 Feb 2019, Huang, Ying wrote:
> 
> Thanks a lot for your review and comments!
> 
> It appears that you have no strong objection for this patch?

That much is correct.

> Could I have your "Acked-by"?

Sorry to be so begrudging, but I have to save my Acks for when I feel
more confident in my opinion.  Here I don't think I can get beyond

Not-Nacked-by: Hugh Dickins <hughd@google.com>

I imagine Daniel would ask for some barriers in there: maybe you can
get a more generous response from him when he looks over the result.

Warmly but meanly,
Hugh
