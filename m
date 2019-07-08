From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Date: Mon, 08 Jul 2019 14:39:36 +0000
Subject: Re: [PATCH] sched/topology: One function call less in build_group_from_child_sched_domain()
Message-Id: <20190708142736.GC10675@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ad2e7dfb-3323-b214-716e-a6cae41b8bcc@web.de>
 <20190706172223.GA12680@linux.vnet.ibm.com>
 <65dedcbc-aefb-eb30-39e1-194248214369@metux.net>
In-Reply-To: <65dedcbc-aefb-eb30-39e1-194248214369@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>

* Enrico Weigelt, metux IT consult <lkml@metux.net> [2019-07-08 11:38:58]:

> > 
> > At runtime, Are we avoiding a function call?
> > However I think we are avoiding a branch instead of a conditional, which may
> > be beneficial.
> 
> If you're assuming the compiler doesn't already optimize that (no idea
> whether gcc really does that).
> 
> @Markus: could you check what gcc is actually generating out of both the
> old and your new version ?
> 
> 

I had already tried looking at the object files both on X86 and PowerPc and
in both cases (with and without patch) the generated code differs.

> --mtx
> 
> -- 
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287
> 

-- 
Thanks and Regards
Srikar Dronamraju
