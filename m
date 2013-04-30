From: Matt Fleming <matt@console-pimps.org>
Date: Tue, 30 Apr 2013 11:33:27 +0000
Subject: Re: [patch] efi: locking fix in efivar_entry_set_safe()
Message-Id: <517FAC07.8000405@console-pimps.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430074312.GD7237@elgon.mountain>
In-Reply-To: <20130430074312.GD7237-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Tom Gundersen <teg-B22kvLQNl6c@public.gmane.org>, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Seiji Aguchi <seiji.aguchi-7rDLJAbr9SE@public.gmane.org>

On 30/04/13 08:43, Dan Carpenter wrote:
> The intent is that if we aren't allowed to block because we're in an
> NMI or an emergency then we only take the lock if it is uncontended.
> 
> Part of the problem is the test is reversed so we return -EBUSY if we
> acquire the lock.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.  I haven't tested this.

This looks correct to me. Thanks!

> diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
> index 1d80c1c..f34d8fe 100644
> --- a/drivers/firmware/efi/vars.c
> +++ b/drivers/firmware/efi/vars.c
> @@ -622,10 +622,12 @@ int efivar_entry_set_safe(efi_char16_t *name, efi_guid_t vendor, u32 attributes,
>  	if (!ops->query_variable_store)
>  		return -ENOSYS;
>  
> -	if (!block && spin_trylock_irqsave(&__efivars->lock, flags))
> -		return -EBUSY;
> -	else
> +	if (!block) {
> +		if (!spin_trylock_irqsave(&__efivars->lock, flags))
> +			return -EBUSY;
> +	} else {
>  		spin_lock_irqsave(&__efivars->lock, flags);
> +	}
>  
>  	status = check_var_size(attributes, size + ucs2_strsize(name, 1024));
>  	if (status != EFI_SUCCESS) {


-- 
Matt Fleming, Intel Open Source Technology Center
