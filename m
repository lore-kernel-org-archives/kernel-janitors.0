From: Joe Perches <joe@perches.com>
Date: Sun, 31 May 2020 22:11:27 +0000
Subject: Re: [PATCH] kernel: power: swap: mark a function as __init to save some memory
Message-Id: <effe3cde7b1f188427c42c476f5a96251d837416.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531210059.647066-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531210059.647066-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, rjw@rjwysocki.net, pavel@ucw.cz, len.brown@intel.com, Dan Carpenter <error27@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

(adding Dan Carpenter)

On Sun, 2020-05-31 at 23:00 +0200, Christophe JAILLET wrote:
> 'swsusp_header_init()' is only called via 'core_initcall'.
> It can be marked as __init to save a few bytes of memory.

Hey Dan

smatch has a full function calling tree right?

Can smatch find unmarked functions called only by __init
functions so those unmarked functions can be appropriately
marked with __init like the below?

> ---
>  kernel/power/swap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index ca0fcb5ced71..01e2858b5fe3 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -1590,7 +1590,7 @@ int swsusp_unmark(void)
>  }
>  #endif
>  
> -static int swsusp_header_init(void)
> +static int __init swsusp_header_init(void)
>  {
>  	swsusp_header = (struct swsusp_header*) __get_free_page(GFP_KERNEL);
>  	if (!swsusp_header)
