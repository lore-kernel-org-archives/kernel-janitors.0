From: Vicente Feito <vicente.feito@gmail.com>
Date: Tue, 08 Feb 2005 08:18:04 +0000
Subject: Re: [KJ] updated kj-devel.pl
Message-Id: <200502080818.04911.vicente.feito@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502041215.01436.vicente.feito@gmail.com>
In-Reply-To: <200502041215.01436.vicente.feito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello.
On Tuesday 08 February 2005 01:02 am, you wrote:
> On Mon, Feb 07, 2005 at 04:46:58PM -0800, Randy.Dunlap wrote:
>  > spinlock misuse detection is often not straightforward.
>  > E.g., in kernel/acct.c (2.6.11-rc3), I'm getting:
>  > Lock closed on line 115
>  > Lock closed on line 162
>  > Obtained spinlock on line 198, but never unlocked.
>  > acct.c:198:             spin_lock(&acct_globals.lock);
>  >
>  >
>  > Lock closed on line 247
>  > Lock closed on line 263
>  > Lock closed on line 521
>  > ^^^^^^^^^^^^^^ these line numbers appear to be off by 1 line.
>  > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> You're probably best off throwing away the spinlock detection code.
> Its horrible, and breaks really easily.  I'm almost
> embarressed to admit to writing it.

I think that it could be fixed, or rewritting it shouldn't take that much 
time, so there's no problem about it, if you have other things that you 
wanted to add to this and didn't cause of time or the fact that you though it 
wasn't absolutely necessary or was complicated/time consuming, you can send 
those to me and I'll add it, or try at least.

>
> Sparse should be able to do a much better job.
>
>   Dave

Vicente.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
