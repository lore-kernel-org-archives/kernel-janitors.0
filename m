From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 14 Sep 2016 17:04:52 +0000
Subject: Re: perf/x86: Use kmalloc_array() in merge_attr()
Message-Id: <20160914170452.GD5016@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <daf81ea8-21bc-d5d0-11af-8957216ae323@users.sourceforge.net>
 <20160905075149.GQ10153@twins.programming.kicks-ass.net>
 <a465479e-59eb-b047-dbe6-f3686b4ecd31@users.sourceforge.net>
In-Reply-To: <a465479e-59eb-b047-dbe6-f3686b4ecd31@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: x86@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Wed, Sep 14, 2016 at 06:40:32PM +0200, SF Markus Elfring wrote:
> 
> Would you like to suggest any more constraints for this kind of
> software refactoring?

Yes, don't do it. If you're writing new code by all means, do whatever
you feel, but don't go changing code just because checkpatch.


