From: Jaswinder Singh <jaswinder@infradead.org>
Date: Sun, 20 Jul 2008 18:24:07 +0000
Subject: Re: [PATCH] x86-kernel: declare some functions before they get used
Message-Id: <1216577527.2706.13.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216050964.2719.4.camel@jaswinder.satnam>
	 <20080720174018.GA16827@elte.hu>
In-Reply-To: <20080720174018.GA16827@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, torvalds@linux-foundation.org, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>

Hello Ingo,

On Sun, 2008-07-20 at 19:40 +0200, Ingo Molnar wrote:
> * Jaswinder Singh <jaswinder@infradead.org> wrote:
> 
> > x86-kernel: declare some functions before they get used
> 
> i like this cleanup - would you mind to do a version of this patch that 
> applies to Linus's latest -git tree?
> 

I divided this patch into many parts.

You already applied ﻿'[PATCH] x86: Introducing asm-x86/traps.h' to ﻿tip/x86/core.

and ﻿'[PATCH] Introducing asm/syscalls.h' is on the floor, I
received ﻿Acked-by: Ralf Baechle <ralf@linux-mips.org> and waiting for
other Acks.

If you merge ﻿﻿'[PATCH] Introducing asm/syscalls.h' to
your ﻿tip/x86/core then I will send you updated patch of '[PATCH]
x86-kernel: declare some functions before they get used' based upon on
your latest tip/x86/core git tree.

If Linus add this ﻿'[PATCH] Introducing asm/syscalls.h' in his tree
then ﻿I will send you updated patch of '[PATCH] x86-kernel: declare some
functions before they get used' based upon on latest Linus git tree.

Please let me know which option is better.

Thank you,

Jaswinder Singh.

