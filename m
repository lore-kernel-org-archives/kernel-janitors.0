From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 30 Dec 2007 15:41:27 +0000
Subject: Re: [PATCH 7/38] arch/x86/ia32: Use time_before, time_before_eq,
Message-Id: <20071230154127.GA10444@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241522410.23999@ask.diku.dk> <20071224153152.GA21971@one.firstfloor.org> <Pine.LNX.4.64.0712241657080.23999@ask.diku.dk> <20071230133335.GA21106@elte.hu> <Pine.LNX.4.64.0712301554430.8187@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712301554430.8187@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Julia Lawall <julia@diku.dk> wrote:

> > your x86 patches (#7, #8 and #9) do not include any *_eq() 
> > comparisons and they all seem to be correct. So picked those three 
> > up into x86.git - let me know if there's any breakage in them that i 
> > missed.
> 
> Only #7 is ok.  The other two have #include <jiffies.h> in the wrong 
> place.  I will send new versions of #8 and #9 shortly.

hm, #include file order in a .c file should normally not matter - why 
are they in the wrong place?

	Ingo
