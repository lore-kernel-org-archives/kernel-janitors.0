From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jul 2019 15:44:13 +0000
Subject: Re: sched/topology: One function call less in build_group_from_child_sched_domain()
Message-Id: <e3ae5bd2-d963-2422-d4f0-131a5d2edbb4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ad2e7dfb-3323-b214-716e-a6cae41b8bcc@web.de>
 <20190706172223.GA12680@linux.vnet.ibm.com>
 <20190708102312.GF3402@hirez.programming.kicks-ass.net>
 <20190708140751.GA10675@linux.vnet.ibm.com>
In-Reply-To: <20190708140751.GA10675@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>

> Yes, it definitely makes code readable.

Some developers seem to get difficulties with this view.


> I was only commenting on the changelog/subject which says
> avoids a function call which I think it doesn't.

Do you prefer an other wording for calling functions only once
with a selected parameter value instead of calling them (unoptimised)
within two branches of an if statement?

Regards,
Markus
