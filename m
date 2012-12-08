From: "H. Peter Anvin" <hpa@zytor.com>
Date: Sat, 08 Dec 2012 03:05:53 +0000
Subject: Re: [patch] x86, efi: precedence error in setup_efi_pci()
Message-Id: <50C2AE91.9060800@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121207061649.GA18220@elgon.mountain>
In-Reply-To: <20121207061649.GA18220-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Matt Fleming <matt.fleming-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 12/06/2012 10:16 PM, Dan Carpenter wrote:
> Negate has higher precedence than bitwise AND so the condition is always
> false.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/arch/x86/boot/compressed/eboot.c b/arch/x86/boot/compressed/eboot.c
> index b1942e2..18e329c 100644
> --- a/arch/x86/boot/compressed/eboot.c
> +++ b/arch/x86/boot/compressed/eboot.c
> @@ -302,7 +302,7 @@ static efi_status_t setup_efi_pci(struct boot_params *params)
>   		if (status != EFI_SUCCESS)
>   			continue;
>
> -		if (!attributes & EFI_PCI_IO_ATTRIBUTE_EMBEDDED_ROM)
> +		if (!(attributes & EFI_PCI_IO_ATTRIBUTE_EMBEDDED_ROM))
>   			continue;
>
>   		if (!pci->romimage || !pci->romsize)
>

What is the baseline for this patch?

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

