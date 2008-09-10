From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 10 Sep 2008 12:04:14 +0000
Subject: Re: [PATCH 2/4] arch/x86/kernel/kdebugfs.c: introduce missing kfree
Message-Id: <20080910120414.GC4970@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0809101357210.15308@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0809101357210.15308@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kmalloc should free the allocated 
> data. Note that at the point of the change, node has not yet been 
> stored in d, so it is not affected by the existing cleanup code.

applied to tip/x86/urgent, thanks Julia.

> The semantic match that finds the problem is as follows: 
> (http://www.emn.fr/x-info/coccinelle/)

cool stuff!

	Ingo
