From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 15 Jul 2008 14:21:43 +0000
Subject: Re: [PATCH] x86: traps and do_traps under one hood
Message-Id: <1216131703.27455.245.camel@shinybook.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216119158.21749.5.camel@jaswinder.satnam>
In-Reply-To: <1216119158.21749.5.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, andi@firstfloor.org

On Tue, 2008-07-15 at 16:22 +0530, Jaswinder Singh wrote:
> Declaring x86 traps under one hood.
> Declaring x86 do_traps before defining them.

> arch/x86/kernel/traps_32.c                |   20 ---------
> arch/x86/kernel/traps_64.c                |   21 ----------
> include/asm-x86/mach-default/mach_traps.h |   62 +++++++++++++++++++++++++++++

You put these back in mach-default/mach_traps.h but does that cover all
possibilities? What about other machine types?

Looking at the ifdefs you introduced in that header, it seems there's
more scope for unification here (although it makes sense for that to
come later).

-- 
dwmw2

