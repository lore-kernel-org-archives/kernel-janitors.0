From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 05 Mar 2008 08:19:05 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <20080305081904.GA17789@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk> <20080305063842.GA24495@elte.hu> <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com> <20080305070201.GA32434@elte.hu> <1204700995.17484.7.camel@brick>
In-Reply-To: <1204700995.17484.7.camel@brick>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Christopher Li <sparse@chrisli.org>, Julia Lawall <julia@diku.dk>, yi.zhu@intel.com, linux-wireless@vger.kernel.org, ipw3945-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexander Viro <viro@ftp.linux.org.uk>, linux-sparse@vger.kernel.org, Josh Triplett <josh@freedesktop.org>


* Harvey Harrison <harvey.harrison@gmail.com> wrote:

> > Al's patch is:
> > 
> > +                       if (op = '&' && expr->left->type = EXPR_PREOP &&
> > +                           expr->left->op = '!')
> > +                               warning(expr->pos, "dubious: !x & y");
> > 
> > i think there might be similar patterns: "x & !y", "!x | y", "x | !y" ?
> > 
> 
> Well, (!x & y) and (!x | y) are probably the two that might have been 
> intended otherwise.  (x & !y), (x | !y) are probably ok.

i think the proper intention in the latter cases is (x & ~y) and
(x | ~y).

My strong bet is that in 99% of the cases they are real bugs and && or 
|| was intended.

	Ingo
