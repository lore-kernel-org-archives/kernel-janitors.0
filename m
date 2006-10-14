From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sat, 14 Oct 2006 09:09:32 +0000
Subject: Re: [KJ] Is documentation in the kernel code desired?
Message-Id: <200610141109.32747.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610131953.05746.lists-receive@programmierforen.de>
In-Reply-To: <200610131953.05746.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Caveat:  don't document obvious things like:
>
> 	i++;		/* increment the array index */
That's quite clear ;)

i++; /* increment the array index */
        /* The line above is a comment :D */
        /* ... */

> It's not clear to me that this is a good kernel-janitors project,
> but I don't want to discourage anyone either.  However, I've tried
> documenting some parts of the kernel code and it's fairly difficult
> to do so in lots of places, unless you are very familiar with the code.
Well, in fact I didn't mean "project". I don't want to start a big 
document-every-line-in-the-kernel-project. But when people read the source 
and try to understand how it works they might also want to take some notes. 
One could transform these notes in documentation comments. This is just an 
idea. I didn't try that out - it could be that documenting the kernel that 
way may be harder than I think.

I'm glad to see that documentation is welcome.

	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
