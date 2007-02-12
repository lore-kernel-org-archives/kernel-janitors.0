From: walter harms <wharms@bfs.de>
Date: Mon, 12 Feb 2007 16:33:13 +0000
Subject: Re: [KJ] need a better name for existing "FIELD_SIZE" macro sound/.
Message-Id: <45D096C9.8070203@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702120748030.23229@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702120748030.23229@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


in my old kernel code is is only used inside the vx driver.
IMHO it can be replaced with VX_FIELD_SIZE

is is only used by functions in .h (eek) and one .c code.

re,
 wh



Robert P. J. Day wrote:
>   one of the outstanding tasks in the wiki is to use the
> "FIELD_SIZE()" macro (currently defined as FIELD_SIZEOF but that's
> being renamed in the patch) in include/linux/kernel.h to simplify some
> code in the tree.  i had already submitted that patch without noticing
> that a few files under the sound/ directory already define a
> "FIELD_SIZE" macro which clashes:
> 
>   $ grep -rw FIELD_SIZE *
> 
>   andrew morton suggested that the easiest solution is to just rename
> the one under the sound/ directory, but i have no idea what that macro
> represents.  anyone know what's going on there and can recommend a
> better (and less universally intrusive) name that doesn't steal prime
> macro naming real estate?
> 
>   once the name "FIELD_SIZE" is reclaimed from those sound files, i
> can resubmit the global patch.  thanks.
> 
> rday
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
