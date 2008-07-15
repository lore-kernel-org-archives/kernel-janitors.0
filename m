From: Jaswinder Singh <jaswinder@infradead.org>
Date: Tue, 15 Jul 2008 15:59:37 +0000
Subject: Re: [PATCH] x86: traps and do_traps under one hood
Message-Id: <1216137250.2747.12.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216119158.21749.5.camel@jaswinder.satnam>
	 <1216129914.20462.1263591561@webmail.messagingengine.com>
In-Reply-To: <1216129914.20462.1263591561@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexander van Heukelum <heukelum@fastmail.fm>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Ingo Molnar <mingo@elte.hu>

Hello ﻿Alexander,

On Tue, 2008-07-15 at 15:51 +0200, Alexander van Heukelum wrote:

> 
> I think moving the declarations to a header file is a good thing,
> but I don't think mach_traps.h is a suitable place. 

﻿I CC new patch to you : [PATCH] x86: Introducing asm-x86/traps.h

> The definitions
> of the functions are in entry_32.S and entry_64.S, so I would suggest
> making a new header include/asm-x86/entry.h. Some other ENTRY's
> (like system_call and some xen-specific ones) would then also fit
> in this header.
> 
> What do you think?

I did this for traps_32.c and traps_64.c because they are complaining
that traps are defined but not declared.

Thank you,

Jaswinder Singh.

