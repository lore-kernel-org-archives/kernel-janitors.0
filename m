From: Christoph Hellwig <hch@infradead.org>
Date: Sat, 14 Feb 2004 17:16:46 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040214171646.A27075@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 14, 2004 at 04:53:02PM +0000, Matthew Wilcox wrote:
> It doesn't warn in that case.
> 
> static int foo(int x, int __attribute__((unused)) y)
> {
>         return x + y;
> }
> 
> Possibly we should call it __optional instead of __unused?

What about finding a gcc switch to turn that silly warning off instead?
It's quite natural at least for method vectors to have unused arguments.
Dito for all kinds of state machines implemented as array of function
pointers, etc...

Basically everywhere where we implement the OO Virtual baseclass paradigm.

> 
> -- 
> "Next the statesmen will invent cheap lies, putting the blame upon 
> the nation that is attacked, and every man will be glad of those
> conscience-soothing falsities, and will diligently study them, and refuse
> to examine any refutations of them; and thus he will by and by convince 
> himself that the war is just, and will thank God for the better sleep 
> he enjoys after this process of grotesque self-deception." -- Mark Twain
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
---end quoted text---
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
