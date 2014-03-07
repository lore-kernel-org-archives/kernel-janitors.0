From: Ingo Molnar <mingo@kernel.org>
Date: Fri, 07 Mar 2014 12:10:22 +0000
Subject: Re: [patch] x86/efi: use GFP_ATOMIC under spin_lock
Message-Id: <20140307121022.GA32575@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140307112055.GE2351@elgon.mountain>
In-Reply-To: <20140307112055.GE2351-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Matt Fleming <matt.fleming-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Nathan Zimmer <nzimmer-sJ/iWh9BUns@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> In phys_efi_get_time() we call efi_call_phys_prelog() with a spin_lock
> so this allocation should be atomic.
> 
> Fixes: b8f2c21db390 ('efi, x86: Pass a proper identity mapping in efi_call_phys_prelog')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
> index 0c2a234fef1e..f5adcadb381b 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -90,7 +90,7 @@ void __init efi_call_phys_prelog(void)
>  	local_irq_save(efi_flags);
>  
>  	n_pgds = DIV_ROUND_UP((max_pfn << PAGE_SHIFT), PGDIR_SIZE);
> -	save_pgd = kmalloc(n_pgds * sizeof(pgd_t), GFP_KERNEL);
> +	save_pgd = kmalloc(n_pgds * sizeof(pgd_t), GFP_ATOMIC);
>  
>  	for (pgd = 0; pgd < n_pgds; pgd++) {
>  		save_pgd[pgd] = *pgd_offset_k(pgd * PGDIR_SIZE);

The allocation there, if it happens within a spinlocked path, is 
probably a layering violation - and GFP_ATOMIC is at best a 
workaround.

Thanks,

	Ingo
