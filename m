From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Wed, 15 Mar 2006 22:19:49 +0000
Subject: Re: [KJ][Patch] coding style cleanp in pcnet_cs.c
Message-Id: <82faac5b0603151419l62a9ea60o95ca57f3dfea8f7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142231320.7791.44.camel@localhost.localdomain>
In-Reply-To: <1142231320.7791.44.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> However, coding style patches should be that and nothing else, so
> hopefully that is the *only* thing in these patches.  In theory

I hope so to.

> one could build a .o file before and after the patch and compare
> the 2 .o files and the only difference would be in the binary
> date in the ELF headers.  (I say in theory, but I actually did
> that [successfully] for coding style fixes to block/floppy.c.)
> It does remove some doubts about the patch (at least for me).

Sounds good, I don't know anything about elf binaries but would there
be debugging info in them that would be different also ?
Exactly how should you compare two elf binaries? I will go check if
there is a diff option for checking binary files, but have no real
idea otherwise.

> Second comment (totally up to Alexey IMO):  I don't see coding
> style cleanups in the current TODO list.  Their main usefulness
> is for code that is ugly as sin but still has to be worked
> on a fair amount (like floppy.c).

Well I am a pedantic bastard, and tend to do stuff like this, not
because it is on a list of stuff to do, but mostly because it annoys
me. I have split the changes so Alexey can reject the clean ups if he
wants.
I will try to refrain from it in future, but can't guarantee anything. :)

Darren J.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
