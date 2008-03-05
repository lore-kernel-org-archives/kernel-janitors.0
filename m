From: "Bart Van Assche" <bart.vanassche@gmail.com>
Date: Wed, 05 Mar 2008 12:30:54 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct use of.and &
Message-Id: <e2e108260803050430o317d3e0dyed50e86cc4569746@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk>
	 <20080305063842.GA24495@elte.hu>
	 <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com>
	 <20080305070201.GA32434@elte.hu>
	 <Pine.LNX.4.64.0803050951550.28021@ask.diku.dk>
	 <20080305122010.GA999@elte.hu>
In-Reply-To: <20080305122010.GA999-X9Un+BFzKDI@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, Christopher Li <sparse-55XgFHCVCFZAfugRpC6u6w@public.gmane.org>, yi.zhu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ipw3945-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Harvey Harrison <harvey.harrison-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Viro <viro-rfM+Q5joDG/XmaaqVzeoHQ@public.gmane.org>, linux-sparse-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>

On Wed, Mar 5, 2008 at 1:20 PM, Ingo Molnar <mingo@elte.hu> wrote:
>
>  * Julia Lawall <julia@diku.dk> wrote:
>
>  > There are some legitimate uses of !x & y which are actually of the
>  > form !x & !y, where x and y are function calls.  That is a not
>  > particularly elegant way of getting both x and y to be evaluated and
>  > then combining the results using "and".  If such code is considered
>  > acceptable, then perhaps the sparse patch should be more complicated.
>
>  i tend to be of the opinion that the details in C source code should be
>  visually obvious and should be heavily simplified down from what is
>  'possible' language-wise - with most deviations and complications that
>  depart from convention considered an error. I'd consider "!fn1() &
>  !fn2()" a borderline coding style violation in any case - and it costs
>  nothing to change it to "!fn1() && !fn2()".

If someone writes (!x & !y) instead of (!x && !y) because both x and y
have to be evaluated, this means that both x and y have side effects.
Please keep in mind that the C language does not specify whether x or
y has to be evaluated first, so if x and y have to be evaluated in
that order, an expression like (!x & !y) can be the cause of very
subtle bugs. I prefer readability above brevity.

Bart Van Assche.
