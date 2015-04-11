From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 11 Apr 2015 11:03:05 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150411110305.GR10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I used to use out: and err: labels but for the past few years my job has
been to look at error handling every day.  I now believe very strongly
that do-nothing gotos are harmful.  It's going to be my contribution to
computer engineering to persuade people to hate exit labels.

https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ

1) "goto err;" is annoying to read because the name is meaningless.

2) Exit labels bad associations because code which uses err: or out:
   labels is often buggy as we have seen in pt_event_add().

3) They don't do anything for return in the middle bugs.  They only
   discourage people from returning at the start of the function where
   direct returns are fine.

   In theory, one place where they might be useful is if we added
   locking to a function later on.  First of all, when we add locking no
   one ever changes the out: label to out_unlock:.  It never happens.

   Also missing unlocks on error paths is sort of a sloppy/newbie
   mistake.  I have looked through the git log and newbies are just as
   likely to get locking wrong when there is an exit label as when there
   is not.

   https://plus.google.com/106378716002406849458/posts/DfuAkt8szf2

4) Exit labels introduce a whole new class of "forgot to set the error
   code" bugs which don't happen with direct returns.

regards,
dan carpenter

