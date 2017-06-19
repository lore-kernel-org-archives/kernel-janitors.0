From: Don Zickus <dzickus@redhat.com>
Date: Mon, 19 Jun 2017 14:22:21 +0000
Subject: Re: [PATCH] x86/nmi: fix timeout test in test_nmi_ipi()
Message-Id: <20170619142221.mqi7wwtr6pi75dad@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170619105304.GA23995@elgon.mountain>
In-Reply-To: <20170619105304.GA23995@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 19, 2017 at 01:53:04PM +0300, Dan Carpenter wrote:
> We're supposed to exit the loop with "timeout" set to zero.
> 
> Fixes: 99e8b9ca90d6 ("x86, NMI: Add NMI IPI selftest")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Don Zickus <dzickus@redhat.com>


> 
> diff --git a/arch/x86/kernel/nmi_selftest.c b/arch/x86/kernel/nmi_selftest.c
> index 6d9582ec0324..d27f8d84c4ff 100644
> --- a/arch/x86/kernel/nmi_selftest.c
> +++ b/arch/x86/kernel/nmi_selftest.c
> @@ -78,7 +78,7 @@ static void __init test_nmi_ipi(struct cpumask *mask)
>  
>  	/* Don't wait longer than a second */
>  	timeout = USEC_PER_SEC;
> -	while (!cpumask_empty(mask) && timeout--)
> +	while (!cpumask_empty(mask) && --timeout)
>  	        udelay(1);
>  
>  	/* What happens if we timeout, do we still unregister?? */
