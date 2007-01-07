From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 07 Jan 2007 20:47:29 +0000
Subject: Re: [KJ] ruminations on kernel.h
Message-Id: <20070107204729.GQ24620@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 07, 2007 at 03:24:41PM -0500, Robert P. J. Day wrote:
>   the various utility macros (ARRAY_SIZE, FIELD_SIZE, min/max,
> container_of, etc.) might fit better into a file called macros.h or
> util.h.
> 
>   then there's all the debugging/logging stuff -- the priority macros,
> loglevel stuff, pr_debug, pr_info, etc.  why not a new file called
> "debug.h"?
> 
>   anyway, you get the idea.  there doesn't seem to be much rhyme or
> reason for what has been tossed into kernel.h.

Well, kernel.h really is misc.h or util.h ;-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
