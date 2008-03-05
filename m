From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 05 Mar 2008 12:36:42 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <20080305123641.GA2365@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk> <20080305063842.GA24495@elte.hu> <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com> <20080305070201.GA32434@elte.hu> <Pine.LNX.4.64.0803050951550.28021@ask.diku.dk> <20080305122010.GA999@elte.hu> <e2e108260803050430o317d3e0dyed50e86cc4569746@mail.gmail.com>
In-Reply-To: <e2e108260803050430o317d3e0dyed50e86cc4569746-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bart.vanassche-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, Christopher Li <sparse-55XgFHCVCFZAfugRpC6u6w@public.gmane.org>, yi.zhu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ipw3945-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Harvey Harrison <harvey.harrison-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Viro <viro-rfM+Q5joDG/XmaaqVzeoHQ@public.gmane.org>, linux-sparse-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>


* Bart Van Assche <bart.vanassche@gmail.com> wrote:

> If someone writes (!x & !y) instead of (!x && !y) because both x and y 
> have to be evaluated, this means that both x and y have side effects.
> Please keep in mind that the C language does not specify whether x or 
> y has to be evaluated first, so if x and y have to be evaluated in 
> that order, an expression like (!x & !y) can be the cause of very 
> subtle bugs. I prefer readability above brevity.

such expressions _must_ be written as:

  ret1 = x();
  ret2 = y();

  if (ret1 && ret2)
	...

any side-effects are totally un-obvious when they are in expressions and 
someone doing cleanups later on could easily change the '&' to '&&' and 
introduce a bug.

	Ingo
