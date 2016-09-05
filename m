From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 05 Sep 2016 07:53:05 +0000
Subject: Re: [PATCH 2/4] perf/x86/cqm: Replace two kmalloc() calls by kmalloc_array() in intel_mbm_init()
Message-Id: <20160905075305.GS10153@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <9d893198-dd12-14a8-74bd-02fc42de4bf4@users.sourceforge.net>
 <ea335aea-b897-875e-4852-1376f6c50821@users.sourceforge.net>
In-Reply-To: <ea335aea-b897-875e-4852-1376f6c50821@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: x86@kernel.org, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Richard Cochran <rcochran@linutronix.de>, Stephane Eranian <eranian@google.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Sun, Sep 04, 2016 at 07:56:30PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Sep 2016 18:25:09 +0200
> 
> 1. A multiplication for the size determination of memory allocations
>    indicated that array data structures should be processed.
>    Thus use the corresponding function "kmalloc_array".
> 
> 2. Replace the specification of a data structure by pointer dereferences
>    to make the corresponding size determination a bit safer according to
>    the Linux coding style convention.
> 
> 3. Delete the local variable "array_size" which became unnecessary
>    with this refactoring.

3 is an admission you made the code worse in absense of other
improvements.
