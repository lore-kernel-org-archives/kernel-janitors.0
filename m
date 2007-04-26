From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 26 Apr 2007 12:39:21 +0000
Subject: Re: [KJ] centralizing arch-specific kernel config settings
Message-Id: <20070426123921.GA7501@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0704260706100.533@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0704260706100.533@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 26, 2007 at 07:06:56AM -0400, Robert P. J. Day wrote:
> in all of the above cases, the Kconfig directive looks like:
> 
> ...
> config GENERIC_BUG
>         bool
>         default y
>         depends on BUG
> ...

It should proably use def_bool y instead of bool, default y.

>   is there any reason config settings like GENERIC_BUG can't be
> centralized in a single place like that?  i'm *guessing* a pile of
> config settings could be simplified like this.

Is it simpler?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
