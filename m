From: walter harms <wharms@bfs.de>
Date: Mon, 05 Mar 2012 18:42:31 +0000
Subject: Re: [patch v2] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <4F550917.9020508@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120305180614.GA26880@elgon.mountain>
In-Reply-To: <20120305180614.GA26880@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Matt Fleming <matt.fleming@intel.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 05.03.2012 19:06, schrieb Dan Carpenter:
> "filename" is a efi_char16_t string so this check for reaching the end
> of the array doesn't work.  We need to cast the pointer to (u8 *) before
> doing the math.
> 
> This patch changes the "filename" to "filename_16" to avoid confusion in
> the future.
> 

maybe it is a bit late,  but ...
is efi_char16_t a generic requirement for EFI ? perhaps we can use wchar_t
since it is intended for such cases. additional we would get an api for free.

just my 2 cents,
 wh


> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Rename "filename" to "filename_16"
>     Also changed cast from (char *) to (u8 *) because it's not a C
>     character string.  Ingo suggested (void *) but that's a GCCism
>     I think.
> 
> diff --git a/arch/x86/boot/compressed/eboot.c b/arch/x86/boot/compressed/eboot.c
> index fec216f..0cdfc0d 100644
> --- a/arch/x86/boot/compressed/eboot.c
> +++ b/arch/x86/boot/compressed/eboot.c
> @@ -539,7 +539,7 @@ static efi_status_t handle_ramdisks(efi_loaded_image_t *image,
>  		struct initrd *initrd;
>  		efi_file_handle_t *h;
>  		efi_file_info_t *info;
> -		efi_char16_t filename[256];
> +		efi_char16_t filename_16[256];
>  		unsigned long info_sz;
>  		efi_guid_t info_guid = EFI_FILE_INFO_ID;
>  		efi_char16_t *p;
> @@ -552,14 +552,14 @@ static efi_status_t handle_ramdisks(efi_loaded_image_t *image,
>  		str += 7;
>  
>  		initrd = &initrds[i];
> -		p = filename;
> +		p = filename_16;
>  
>  		/* Skip any leading slashes */
>  		while (*str = '/' || *str = '\\')
>  			str++;
>  
>  		while (*str && *str != ' ' && *str != '\n') {
> -			if (p >= filename + sizeof(filename))
> +			if ((u8 *)p >= (u8 *)filename_16 + sizeof(filename_16))
>  				break;
>  
>  			*p++ = *str++;
> @@ -583,7 +583,7 @@ static efi_status_t handle_ramdisks(efi_loaded_image_t *image,
>  				goto free_initrds;
>  		}
>  
> -		status = efi_call_phys5(fh->open, fh, &h, filename,
> +		status = efi_call_phys5(fh->open, fh, &h, filename_16,
>  					EFI_FILE_MODE_READ, (u64)0);
>  		if (status != EFI_SUCCESS)
>  			goto close_handles;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
