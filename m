From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 02 Jun 2007 14:59:10 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <20070602145910.GV23968@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jun 02, 2007 at 11:59:22AM +0000, Andi Drebes wrote:
> I recently grep'd through the kernel sources and found *a lot* of lines
> that are commented out using #if 0. Is there any reason to keep them?

Yes -- the people who wrote the code originally put them there.  Unless
you're willing to go through each one, and figure out whether it's still
useful or not for anyone reading this section of code later, it's
better to leave it alone.

Why are comments considered useful, yet commented-out sections of code
considered worthy of deletion?  The latter are potentially more useful.
Of course things can be taken too far and #if 0 / #if 1 sections can
clutter up the function and make it harder to understand.  But each one
needs to be taken in context and understood, not mindlessly excised.

I think the kernel-janitors need a Hypocritic Oath.  First, do no harm.
I'm a little sensitive to so-called 'trivial' changes right now, given
that Kyle just spent two days tracking down breakages on parisc from
these kinds of patches.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
