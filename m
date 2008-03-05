From: Julia Lawall <julia@diku.dk>
Date: Wed, 05 Mar 2008 08:55:49 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <Pine.LNX.4.64.0803050951550.28021@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk>
 <20080305063842.GA24495@elte.hu> <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com>
 <20080305070201.GA32434@elte.hu>
In-Reply-To: <20080305070201.GA32434-X9Un+BFzKDI@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Christopher Li <sparse-55XgFHCVCFZAfugRpC6u6w@public.gmane.org>, yi.zhu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ipw3945-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Harvey Harrison <harvey.harrison-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Viro <viro-rfM+Q5joDG/XmaaqVzeoHQ@public.gmane.org>, linux-sparse-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>

There are some legitimate uses of !x & y which are actually of the form !x 
& !y, where x and y are function calls.  That is a not particularly 
elegant way of getting both x and y to be evaluated and then combining the 
results using "and".  If such code is considered acceptable, then perhaps 
the sparse patch should be more complicated.

julia

> Al's patch is:
> 
> +                       if (op = '&' && expr->left->type = EXPR_PREOP &&
> +                           expr->left->op = '!')
> +                               warning(expr->pos, "dubious: !x & y");
> 
> i think there might be similar patterns: "x & !y", "!x | y", "x | !y" ?
> 
> 	Ingo
> 
