From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 09 Apr 2015 12:45:30 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409124530.GW5029@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 03:33:36PM +0300, Dan Carpenter wrote:
> Also I have come to despise "err" labels.  They do one of three things:
> 
> 1) Nothing.  These are a pointless interruption for people reading the
>    code from top to bottom because you wonder, "How is goto err
>    different from return -ENOMEM?".  You scroll down to the bottom and
>    find that they are the same.  Now you have lost your place and your
>    train of thought.
> 
> 2) One thing.  In this case the label is poorly named, better to say
>    "goto unlock".
> 
> 3) Everything.  This is a leading source of error handling bugs.  It
>    looks like this.
> 
> err:
> 	kfree(foo);
> 	return ret;

  4) unwind complex state; see for example copy_process(). You do not
  want to endlessly duplicate the increasing cleanup for every exit.

> Later we will change it so that foo is allocated with kmemdup_user()
> instead of kmalloc() so now kfree() will oops trying to free the error
> pointer.  

That's just poor engineering in the first place, if you change the alloc
site you had better also look for all the free sites. Error labels have
nothing to do with that, alloc/free can be otherwise separated and hard
to correlate, in fact error labels can be some of the easier places to
find.

> I see so many one err bugs it's not even funny

Well, that's a side effect of us not actually testing many of our error
paths :/
