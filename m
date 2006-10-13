From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 13 Oct 2006 22:10:05 +0000
Subject: Re: [KJ] Is documentation in the kernel code desired?
Message-Id: <20061013151005.618f489b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610131953.05746.lists-receive@programmierforen.de>
In-Reply-To: <200610131953.05746.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 13 Oct 2006 19:53:05 +0200 Andi Drebes wrote:

> Hi everybody!
> I'm currently going through some code in the kernel to understand how things 
> work. I have to admit that some pieces are poorly documented. Especially for 
> kernel newbies like me, documentation in the code could help a lot.
> I think that some lines of documentation at the top of important functions 
> would be nice. I'm asking, because I don't know if documentation in the code 
> is really desired as it blows up the code and requires changes in the 
> documentation, too if the code is modified.
> Code-documentation could also be a nice project for the kernel-janitors.

In general, yes, we want/need more documentation.
Caveat:  don't document obvious things like:

	i++;		/* increment the array index */

It's more important to document why something is done and
generally how it is done.  "What" is important, but could easily
be one or two sentences, while the why and how may take much more.

It's not clear to me that this is a good kernel-janitors project,
but I don't want to discourage anyone either.  However, I've tried
documenting some parts of the kernel code and it's fairly difficult
to do so in lots of places, unless you are very familiar with the code.


Where to put the documentation:
Unless it's a small book, putting it before the function body
in kernel-doc is the best place for it.  If it's a small book,
most developers (unscientfic :) seem to prefer to put it in the
kernel Documentation/ directory.  OTOH, some people want to move
as much as possible out of that directory and into the source files.
I don't agree that that is always the right answer.

Anyway, if any of you can generate and send documentation, please
go for it.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
