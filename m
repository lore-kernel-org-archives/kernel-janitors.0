From: Harvey Harrison <harvey.harrison@gmail.com>
Date: Wed, 05 Mar 2008 07:09:55 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <1204700995.17484.7.camel@brick>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk>
	 <20080305063842.GA24495@elte.hu>
	 <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com>
	 <20080305070201.GA32434@elte.hu>
In-Reply-To: <20080305070201.GA32434-X9Un+BFzKDI@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Christopher Li <sparse-55XgFHCVCFZAfugRpC6u6w@public.gmane.org>, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, yi.zhu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ipw3945-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-rfM+Q5joDG/XmaaqVzeoHQ@public.gmane.org>, linux-sparse-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>

On Wed, 2008-03-05 at 08:02 +0100, Ingo Molnar wrote:
> * Christopher Li <sparse@chrisli.org> wrote:
> 
> > I think Al Viro has sent a patch to linux-sparse with subject "[PATCH 
> > 3/3] catch !x & y brainos" does exactly that.
> 
> ah - nice :-)
> 
> /me checks the linux-sparse archive
> 
> Al's patch is:
> 
> +                       if (op = '&' && expr->left->type = EXPR_PREOP &&
> +                           expr->left->op = '!')
> +                               warning(expr->pos, "dubious: !x & y");
> 
> i think there might be similar patterns: "x & !y", "!x | y", "x | !y" ?
> 

Well, (!x & y) and (!x | y) are probably the two that might have been
intended otherwise.  (x & !y), (x | !y) are probably ok.

Harvey

