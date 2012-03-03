From: Ingo Molnar <mingo@elte.hu>
Date: Sat, 03 Mar 2012 07:54:43 +0000
Subject: Re: [patch] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <20120303075443.GC16816@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302190128.GC3951@elgon.mountain>
In-Reply-To: <20120302190128.GC3951@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Matt Fleming <matt.fleming@intel.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "filename" is a efi_char16_t string so this check for reaching 
> the end of the array doesn't work.  We need to cast it to char 
> pointer before doing the math.

That name should really be changed, 'filename' is a char * by 
convention pretty much everywhere in the kernel - so the current 
naming is highly misleading and results in bugs like this.

filename_16, filename_2byte or filename_UTF or so would be 
suggestive enough to avoid such mishaps in the future.

> @@ -559,7 +559,7 @@ static efi_status_t handle_ramdisks(efi_loaded_image_t *image,
>  			str++;
>  
>  		while (*str && *str != ' ' && *str != '\n') {
> -			if (p >= filename + sizeof(filename))
> +			if ((char *)p >= (char *)filename + sizeof(filename))
>  				break;

I'd also make that void *, because this isnt really a C 
character string anymore.

Thanks,

	Ingo
