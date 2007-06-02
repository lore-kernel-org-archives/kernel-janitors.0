From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 02 Jun 2007 15:47:55 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <20070602154755.GW23968@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jun 02, 2007 at 11:29:54AM -0400, Robert P. J. Day wrote:
> first, it's "hippocratic".

Thanks for failing to get the joke.

> second, if patches are submitted by
> janitors that cause actual breakage, then i suggest it's the fault of
> the official maintainers who eventually *applied* those patches.  few
> janitors have the authority to *force* a patch on anyone's tree, so if
> a KJ patch f**ks something up, i suggest the blame lies elsewhere.

Gotcha.  Janitors are perfect, people who actually implement features
and fix bugs are sloppy and idiots.

> i submit, matthew, that there wouldn't even be a *need* for a kernel
> janitors project if so many developers weren't so lazy and/or sloppy.
> but, sadly, they are, and the annoying part of all of this is that a
> lot of those developers are quite happy to leave the scut work to the
> janitors, but get all excited and put out when the occasional patches
> are submitted that cause breakage.
> 
> if folks like you are so irked by broken patches, then the solution is
> simple -- fix all your own code and don't accept anything from
> janitors.  but as long as you feel like leaving that sort of
> maintenance to people who offer to be janitors, then you should be
> prepared to deal with the occasional bad patch.
> 
> and, you know, saying "thank you" for all that janitorial effort every
> so often probably wouldn't be out of line, either.

I appreciate you're just starting out, and doing janitorial patches are
a great way to do that, but you really need to either lose the attitude,
or do something to earn it.

I'll even make you an offer -- want to become the ncr53c8xx maintainer?
It's in use on a whole lot of older parisc machines, and needs a fairly
significant amount of love.  There's lots of commonality with the sym2
driver, so we can cooperate and share ideas.  You probably don't have
hardware, so I'll also commit to getting some hardware to you and/or
access to machines with remote console and power management.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
