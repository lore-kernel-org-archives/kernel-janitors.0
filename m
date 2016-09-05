From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 05 Sep 2016 07:51:49 +0000
Subject: Re: [PATCH] perf/x86: Use kmalloc_array() in merge_attr()
Message-Id: <20160905075149.GQ10153@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <daf81ea8-21bc-d5d0-11af-8957216ae323@users.sourceforge.net>
In-Reply-To: <daf81ea8-21bc-d5d0-11af-8957216ae323@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: x86@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Sun, Sep 04, 2016 at 11:00:15AM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Sep 2016 10:45:20 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data structure by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.

Why!?
