From: Daniel Jordan <daniel.m.jordan@oracle.com>
Date: Thu, 31 Jan 2019 01:52:32 +0000
Subject: Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NULL derefs
Message-Id: <20190131015231.e6lggsi2ug77qr6c@ca-dmjordan1.us.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
 <20190115002305.15402-1-daniel.m.jordan@oracle.com>
 <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
In-Reply-To: <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, shli@kernel.org, ying.huang@intel.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, will.deacon@arm.com

On Tue, Jan 29, 2019 at 10:26:22PM -0800, Andrew Morton wrote:
> LGTM, but like most people I'm afraid to ack it ;)
> 
> mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch is very
> stuck so can you please redo this against mainline?

Yep, I can do that.
