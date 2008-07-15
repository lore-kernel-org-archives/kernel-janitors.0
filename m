From: Jaswinder Singh <jaswinder@infradead.org>
Date: Tue, 15 Jul 2008 16:11:38 +0000
Subject: Re: [PATCH] x86: Introducing asm-x86/syscalls.h
Message-Id: <1216137578.2747.16.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216114072.21749.1.camel@jaswinder.satnam>
	 <1216127174.30096.3.camel@jaswinder.satnam>
	 <1216133883.27455.252.camel@shinybook.infradead.org>
In-Reply-To: <1216133883.27455.252.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

Hello David,

On Tue, 2008-07-15 at 07:58 -0700, David Woodhouse wrote:

> I don't like this bit though:
> 
> > --- a/include/linux/syscalls.h
> > +++ b/include/linux/syscalls.h
> > @@ -65,6 +65,10 @@ struct getcpu_cache;
> >  #include <linux/quota.h>
> >  #include <linux/key.h>
> >  
> > +#ifdef CONFIG_X86
> > +#include <asm/syscalls.h>
> > +#endif
> > +
> >  asmlinkage long sys_time(time_t __user *tloc);
> >  asmlinkage long sys_stime(time_t __user *tptr);
> >  asmlinkage long sys_gettimeofday(struct timeval __user *tv,
> 
> We're going to want to do this for all architectures, aren't we? Perhaps
> it's better to provide <asm/syscalls.h> for all architectures from the
> beginning, and not bother with the ifdef? Or if you must have an ifdef,
> perhaps make it on something like ARCH_HAS_ASM_SYSCALLS_H rather than
> having to change it every time an architecture adds its own
> <asm/syscalls.h> file?
> 

OK, I will also create asm/syscalls.h for all the architectures.

Thank you,

Jaswinder Singh.

