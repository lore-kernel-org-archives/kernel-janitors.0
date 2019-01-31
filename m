From: "Huang\, Ying" <ying.huang@intel.com>
Date: Thu, 31 Jan 2019 02:48:29 +0000
Subject: About swapoff race patch  (was Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NULL d
Message-Id: <87tvhpy22q.fsf_-_@yhuang-dev.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
	<20190115002305.15402-1-daniel.m.jordan@oracle.com>
	<20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
In-Reply-To: <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
	(Andrew Morton's message of "Tue, 29 Jan 2019 22:26:22 -0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, shli@kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, will.deacon@arm.com

Andrew Morton <akpm@linux-foundation.org> writes:
> mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch is very
> stuck so can you please redo this against mainline?

Allow me to be off topic, this patch has been in mm tree for quite some
time, what can I do to help this be merged upstream?

Best Regards,
Huang, Ying
