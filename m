From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 17:38:15 +0000
Subject: Re: perf/x86: Use kmalloc_array() in merge_attr()
Message-Id: <ad27a3a5-87de-b234-fb4a-2f3ab8bbcbc2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <daf81ea8-21bc-d5d0-11af-8957216ae323@users.sourceforge.net>
 <20160905075149.GQ10153@twins.programming.kicks-ass.net>
 <a465479e-59eb-b047-dbe6-f3686b4ecd31@users.sourceforge.net>
 <20160914170452.GD5016@twins.programming.kicks-ass.net>
In-Reply-To: <20160914170452.GD5016@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Would you like to suggest any more constraints for this kind of
>> software refactoring?
> 
> Yes, don't do it.

I am bit surprised by this feedback.


> If you're writing new code by all means, do whatever you feel,

Could you accept related software updates then?


> but don't go changing code just because checkpatch.

Why is this not a valid reason for you?

How useful can properties that are provided by a function like
kmalloc_array() be also for software modules which you care about?


Do you find any other software improvements more worthwhile?

Regards,
Markus
