From: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Date: Tue, 30 Oct 2007 12:17:12 +0000
Subject: Re: [patch] standardising boolean variables in drivers/net (first
Message-Id: <20071030121712.GA26163@ghostprotocols.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af42259d0710300134h63515753i6bcdad897a6296c3@mail.gmail.com>
In-Reply-To: <af42259d0710300134h63515753i6bcdad897a6296c3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Tue, Oct 30, 2007 at 07:34:04PM +1100, Lucas Woods escreveu:
> First patch here, be gentle, please let me know if I've made a mess of this :)
> 
> 
> Phase 1 standardised boolean variables in drivers/net
> 
> --
> diff --git a/drivers/net/ipg.h b/drivers/net/ipg.h
> index d5d092c..f67b29b 100644
> --- a/drivers/net/ipg.h
> +++ b/drivers/net/ipg.h
> @@ -491,37 +491,37 @@ enum ipg_regs {
>   */
> 
>  /* Miscellaneous Constants. */
> -#define   TRUE  1
> -#define   FALSE 0
> +#define   true  1
> +#define   false 0

You don't need to define 'true' and 'false', they are already defined in
include/linux/stddef.h

- Arnaldo
