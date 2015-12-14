From: Scott Wood <scottwood@freescale.com>
Date: Mon, 14 Dec 2015 22:20:05 +0000
Subject: Re: [POWERPC] bootwrapper: One check less in fsl_get_immr() after error detection
Message-Id: <1450131605.15946.396.camel@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566F3E49.2010506@users.sourceforge.net>
In-Reply-To: <566F3E49.2010506@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, 2015-12-14 at 23:10 +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 14 Dec 2015 23:01:32 +0100
> 
> A status check was performed by the fsl_get_immr() function even if it
> was known already that a system setting did not fit to the expectations.
> 
> This implementation detail could be improved by an adjustment for
> a jump label according to the Linux coding style convention.

What is the actual problem you're trying to solve?  Cluttering the code to
micro-optimize an error path is not an improvement.

-Scott

