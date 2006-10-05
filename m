From: walter harms <wharms@bfs.de>
Date: Thu, 05 Oct 2006 15:12:53 +0000
Subject: Re: [KJ] ARCH=um compile error
Message-Id: <452520F5.7020409@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <31029.196.25.255.210.1160058762.squirrel@krooninfsys.dyndns.org>
In-Reply-To: <31029.196.25.255.210.1160058762.squirrel@krooninfsys.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ask the internet (aka google). there is a
http://gentoo-wiki.com/HOWTO_User_Mode_Linux
and patch.

re,
 wh



Jaco Kroon wrote:
> Hi guys,
> 
> Probably not the right place to post this (should probably contact the
> maintainers of UML) but in 2.6.18 the file
> ./arch/um/os/sys-i386/registers.c fails to compile with the following
> compile error:
> 
> arch/um/os-Linux/sys-i386/registers.c: In function `get_thread_regs':
> arch/um/os-Linux/sys-i386/registers.c:137: error: `JB_PC' undeclared
> (first use in this function)
> arch/um/os-Linux/sys-i386/registers.c:137: error: (Each undeclared
> identifier is reported only once
> arch/um/os-Linux/sys-i386/registers.c:137: error: for each function it
> appears in.)
> arch/um/os-Linux/sys-i386/registers.c:138: error: `JB_SP' undeclared
> (first use in this function)
> arch/um/os-Linux/sys-i386/registers.c:139: error: `JB_BP' undeclared
> (first use in this function)
> 
> Grep'ing for these "symbols" reveals that they're not used anywhere else,
> or declared directly (perhaps declared via pasting of sorts) but I cannot
> locate these declarations.
> 
> Any suggestions on how to approach this problem?
> 
> Jaco
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
