From: Jiri Slaby <jirislaby@gmail.com>
Date: Mon, 31 May 2010 17:37:14 +0000
Subject: Re: [PATCH] Drivers: Stagins: memrar: cleanup
Message-Id: <4C03F3CA.6070809@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C03CFED.2030101@gmail.com>
In-Reply-To: <4C03CFED.2030101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spyros Papageorgiou <spyros.papageorgiou@gmail.com>
Cc: gregkh@suse.de, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, ossama.othman@intel.com, Kernel development list <linux-kernel@vger.kernel.org>

On 05/31/2010 05:04 PM, Spyros Papageorgiou wrote:
> From:Spyros Papageorgiou <spyros.papageorgiou@gmai.com>
> 
> Removed an unneeded struct specifier in function call.
> 
> Signed-off-by: Spyros Papageorgiou <spyros.papageorgiou@gmai.com>
> ---
>  drivers/staging/memrar/memrar_allocator.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/memrar/memrar_allocator.c b/drivers/staging/memrar/memrar_allocator.c
> index a4f8c58..db37c6a 100644
> --- a/drivers/staging/memrar/memrar_allocator.c
> +++ b/drivers/staging/memrar/memrar_allocator.c
> @@ -276,7 +276,7 @@ long memrar_allocator_free(struct memrar_allocator *allocator,
>  
>  		struct memrar_address_range * const chunk >  			&list_entry(pos,
> -				    struct memrar_address_ranges,
> +				    memrar_address_ranges,
>  				    list)->range;

It is not a function call, it's a macro. Did you try to compile this?
