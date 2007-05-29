From: Martin Baeuml <baeuml@gmail.com>
Date: Tue, 29 May 2007 09:58:06 +0000
Subject: Re: [KJ] [PATCH] drivers/video: fix compiler warnings
Message-Id: <20070529095806.GA5204@sisko.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070528222828.GA25955@sisko.site>
In-Reply-To: <20070528222828.GA25955@sisko.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 29, 2007 at 01:11:31AM +0200, Richard Knutsson wrote:
> matroxfb_PLL_mavenclock() will initialize this variable (have not 
> checked the rest).

The rest will be initialized, too. This patch was only supposed to
remove the warnings.

> When the compiler warns about "may be used 
> uninitialized", it is code for "I have no clue what is happening". So 
> most of them is alright and we need to check them by hand. There has 
> been some attempt to fix this (the problem is, initialize them when it 
> is not needed is just cruft) by some macros and such...

Is there a preferred way of removing such warnings then?  I'd say it's
ok to let the compiler generate one or two more instructions to
remove the warning unless in very critical paths...  Nobody should ever be
able to measure this as a performance penalty.

Martin
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
