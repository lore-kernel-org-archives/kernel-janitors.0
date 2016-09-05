From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 05 Sep 2016 07:52:39 +0000
Subject: Re: [PATCH 1/4] perf/x86/cqm: Use kmalloc_array() in intel_mbm_init()
Message-Id: <20160905075239.GR10153@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <9d893198-dd12-14a8-74bd-02fc42de4bf4@users.sourceforge.net>
 <a1428b11-09f8-9e13-13a0-5a1367e070e6@users.sourceforge.net>
In-Reply-To: <a1428b11-09f8-9e13-13a0-5a1367e070e6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: x86@kernel.org, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Richard Cochran <rcochran@linutronix.de>, Stephane Eranian <eranian@google.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Sun, Sep 04, 2016 at 07:54:47PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Sep 2016 17:28:13 +0200
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

Again, lack of actual reason..
