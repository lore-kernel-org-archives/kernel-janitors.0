From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 12 Aug 2013 19:58:30 +0000
Subject: Re: [PATCH 9/16] arch/arm/mach-pxa/mioa701.c: Avoid using ARRAY_AND_SIZE(e) as a function argument
Message-Id: <87r4dyy93t.fsf@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376239917-15594-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376239917-15594-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376239917-15594-10-git-send-email-Julia.Lawall@lip6.fr> (Julia
 Lawall's message of "Sun, 11 Aug 2013 18:51:50 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Replace ARRAY_AND_SIZE(e) in function argument position to avoid hiding the
> arity of the called function.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

As a side I'm curious why this change didn't touch also :
sound/soc/pxa/mioa701_wm9713.c

If it does, this ack stands as well for the other file (with removal of the
#define in mioa701_wm9713.c).

Cheers.

--
Robert
