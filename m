From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 16:40:32 +0000
Subject: Re: perf/x86: Use kmalloc_array() in merge_attr()
Message-Id: <a465479e-59eb-b047-dbe6-f3686b4ecd31@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <daf81ea8-21bc-d5d0-11af-8957216ae323@users.sourceforge.net>
 <20160905075149.GQ10153@twins.programming.kicks-ass.net>
In-Reply-To: <20160905075149.GQ10153@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> * A multiplication for the size determination of a memory allocation
>>   indicated that an array data structure should be processed.
>>   Thus use the corresponding function "kmalloc_array".
>>
>>   This issue was detected by using the Coccinelle software.
>>
>> * Replace the specification of a data structure by a pointer dereference
>>   to make the corresponding size determination a bit safer according to
>>   the Linux coding style convention.
> 
> Why!?

How do you think about an information like the following from
the well-known script "checkpatch.pl"?

WARNING: Prefer kmalloc_array over kmalloc with multiply


Would you like to suggest any more constraints for this kind of
software refactoring?

Regards,
Markus
