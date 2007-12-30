From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 30 Dec 2007 13:33:35 +0000
Subject: Re: [PATCH 7/38] arch/x86/ia32: Use time_before, time_before_eq,
Message-Id: <20071230133335.GA21106@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241522410.23999@ask.diku.dk> <20071224153152.GA21971@one.firstfloor.org> <Pine.LNX.4.64.0712241657080.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241657080.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Julia Lawall <julia@diku.dk> wrote:

> On Mon, 24 Dec 2007, Andi Kleen wrote:
> 
> > On Mon, Dec 24, 2007 at 03:23:19PM +0100, Julia Lawall wrote:
> > > From: Julia Lawall <julia@diku.dk>
> > > 
> > > The functions time_before, time_before_eq, time_after, and time_after_eq
> > > are more robust for comparing jiffies against other values.
> > 
> > The old code was actually correct I think, but the change is ok for me.
> 
> Please ignore the patch.  All of my before_eq and after_eq's are 
> backwards due to parsing <= as >= and vice versa.  I will try again.

your x86 patches (#7, #8 and #9) do not include any *_eq() comparisons 
and they all seem to be correct. So picked those three up into x86.git - 
let me know if there's any breakage in them that i missed.

	Ingo
