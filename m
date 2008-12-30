From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 30 Dec 2008 18:11:51 +0000
Subject: Re: [PATCH 2/2] arch/powerpc/platforms/85xx: Add local_irq_restore in error handling code
Message-Id: <3A41A734-8709-4AC6-ADFD-430D3C1E5DC8@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812212154240.3635@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812212154240.3635@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On Dec 21, 2008, at 2:54 PM, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
>
> There is a call to local_irq_restore in the normal exit case, so it  
> would
> seem that there should be one on an error return as well.
>
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@
> expression l;
> expression E,E1,E2;
> @@
>
> local_irq_save(l);
> ... when != local_irq_restore(l)
>    when != spin_unlock_irqrestore(E,l)
>    when any
>    when strict
> (
> if (...) { ... when != local_irq_restore(l)
>               when != spin_unlock_irqrestore(E1,l)
> +   local_irq_restore(l);
>    return ...;
> }
> |
> if (...)
> +   {local_irq_restore(l);
>    return ...;
> +   }
> |
> spin_unlock_irqrestore(E2,l);
> |
> local_irq_restore(l);
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> arch/powerpc/platforms/85xx/smp.c |    1 +
> 1 file changed, 1 insertion(+)

applied.

- k
