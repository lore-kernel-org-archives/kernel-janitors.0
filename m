From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Mon, 11 Jun 2007 12:25:31 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/isdn/hisax: ARRAY_SIZE instead of sizeof
Message-Id: <82faac5b0706110525s56bade43rb24619b54687770d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706101235.09578.lists-receive@programmierforen.de>
	 <20070610131122.GB3588@pingi.kke.suse.de>
	 <20070610131402.GR2649@lug-owl.de>
	 <200706111120.07730.lists-receive@programmierforen.de>
In-Reply-To: <200706111120.07730.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Drebes <lists-receive@programmierforen.de>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, kernel-janitors@lists.osdl.org, linux-kernel <linux-kernel@vger.kernel.org>, Karsten Keil <kkeil@suse.de>

G'day Andi,

On 6/11/07, Andi Drebes <lists-receive@programmierforen.de> wrote:

> > I'd suggest to not use another define, but use ARRAY_SIZE(foo)
> > _instead of_ eg. FNCOUNT.
> I thought of this, too, but I tried to keep things consistent. Let me
> explain that a little bit more in detail. If you have a look at the files
> in drivers/isdn/hisax then you will see that a lot of array size definitions
> are assigned to preprocessor macros. So I thought removing just one
> of the macros while the other continue to exist would make the code
> a little bit more inconsistent. However, one might disagree about that.
> So here's another patch that includes the changes from the original patch
> and removes the FNCOUNT preprocessor definition. Perhaps the original
> authors of the files should decide wether they want to keep it or not.

I think what was meant here was to remove _all_ the macros that you
assigned to the ARRAY_SIZE() macro.


If you look at the two advantages replacing code with the ARRAY_SIZE()
macro has;
1. More readable/consistent code.
2. Faster compile times, because of less macros being defined.

If you were to simply redefine other macro's to be an ARRAY_SIZE()
macro, the code will still contain the original macro's that people
will have to look up, so would _not_ be more readable/consistent and
you now have two stages of macro replacement, so the code will
actually take _longer_ to compile.

So to get the benefit of this change you have to _remove_ all the
macros that are somehow equivalent to ARRAY_SIZE(), and replace their
use in the code, with an appropriate ARRAY_SIZE() usage.

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
