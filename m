From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Wed, 13 May 2015 19:52:29 +0000
Subject: Re: [patch] ARM: pxa: pxa_cplds: signedness bug in probe
Message-Id: <87lhgsl0g2.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150513113239.GA31617@mwanda>
In-Reply-To: <20150513113239.GA31617@mwanda> (Dan Carpenter's message of "Wed,
 13 May 2015 14:32:39 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> "base_irq" needs to be signed for the error handling to work.  Also we
> can remove the initialization because we re-assign it later.
Indeed.

I suppose smatch found this one with :
   arch/arm/mach-pxa/pxa_cplds_irqs.c:126 cplds_probe() warn: unsigned
   'base_irq' is never less than zero.
I still don't see which tool found the "re-assign" part ...

Anyway, thanks for this, I'll queue it in pxa/fixes.

Cheers.

--
Robert
