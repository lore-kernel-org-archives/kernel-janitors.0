From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 05 Mar 2008 12:20:10 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <20080305122010.GA999@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk> <20080305063842.GA24495@elte.hu> <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com> <20080305070201.GA32434@elte.hu> <Pine.LNX.4.64.0803050951550.28021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803050951550.28021@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Christopher Li <sparse@chrisli.org>, yi.zhu@intel.com, linux-wireless@vger.kernel.org, ipw3945-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Alexander Viro <viro@ftp.linux.org.uk>, linux-sparse@vger.kernel.org, Josh Triplett <josh@freedesktop.org>


* Julia Lawall <julia@diku.dk> wrote:

> There are some legitimate uses of !x & y which are actually of the 
> form !x & !y, where x and y are function calls.  That is a not 
> particularly elegant way of getting both x and y to be evaluated and 
> then combining the results using "and".  If such code is considered 
> acceptable, then perhaps the sparse patch should be more complicated.

i tend to be of the opinion that the details in C source code should be 
visually obvious and should be heavily simplified down from what is 
'possible' language-wise - with most deviations and complications that 
depart from convention considered an error. I'd consider "!fn1() & 
!fn2()" a borderline coding style violation in any case - and it costs 
nothing to change it to "!fn1() && !fn2()".

	Ingo
