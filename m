From: Joe Perches <joe@perches.com>
Date: Sat, 29 Aug 2015 23:53:32 +0000
Subject: Re: [PATCH 8/8] staging: lustre: put constant on the right of binary operator
Message-Id: <1440892412.3276.10.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1440869412-4899-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Oleg Drokin <oleg.drokin@intel.com>, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sat, 2015-08-29 at 19:30 +0200, Julia Lawall wrote:
> Move constants to the right of binary operators.
[]
> diff --git a/drivers/staging/lustre/lustre/ptlrpc/client.c b/drivers/staging/lustre/lustre/ptlrpc/client.c
[]
> @@ -2954,7 +2954,7 @@ void ptlrpc_init_xid(void)
>  	}
>  
>  	/* Always need to be aligned to a power-of-two for multi-bulk BRW */
> -	CLASSERT((PTLRPC_BULK_OPS_COUNT & (PTLRPC_BULK_OPS_COUNT - 1)) = 0);
> +	CLASSERT(((PTLRPC_BULK_OPS_COUNT - 1) & PTLRPC_BULK_OPS_COUNT) = 0);

This one would probably be better as

	CLASSERT(is_power_of_2(PTLRPC_BULK_OPS_COUNT));



