From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Aug 2017 20:55:10 +0000
Subject: Re: [PATCH v2] x86/microcode: Silence a static checker warning
Message-Id: <20170824205510.zy574qloxb4tsokq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
 <20170824201557.ev4ebslf6sg6xmne@mwanda>
 <20170824204714.jedeaphwmou5qafd@pd.tnic>
In-Reply-To: <20170824204714.jedeaphwmou5qafd@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 24, 2017 at 10:47:14PM +0200, Borislav Petkov wrote:
> diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
> index 59edbe9d4ccb..0179f0fd8a79 100644
> --- a/arch/x86/kernel/cpu/microcode/intel.c
> +++ b/arch/x86/kernel/cpu/microcode/intel.c
> @@ -146,7 +146,7 @@ static bool microcode_matches(struct microcode_header_intel *mc_header,
>  	return false;
>  }
>  
> -static struct ucode_patch *__alloc_microcode_buf(void *data, unsigned int size)
> +static struct ucode_patch *memdup_patch(void *data, unsigned int size)
>  {
>  	struct ucode_patch *p;
>  
> @@ -183,11 +183,13 @@ static void save_microcode_patch(void *data, unsigned int size)
>  			if (mc_hdr->rev <= mc_saved_hdr->rev)
>  				continue;
>  
> -			p = __alloc_microcode_buf(data, size);
> -			if (IS_ERR(p))
> +			p = memdup_patch(data, size);
> +			if (IS_ERR(p)) {
>  				pr_err("Error allocating buffer %p\n", data);
> -			else
> -				list_replace(&iter->plist, &p->plist);
> +				continue;
> +			}
> +
> +			list_replace(&iter->plist, &p->plist);
>  		}
>  	}
>  

This is just cleanups and doesn't change the behavior.

> @@ -196,11 +198,12 @@ static void save_microcode_patch(void *data, unsigned int size)
>  	 * newly found.
>  	 */
>  	if (!prev_found) {
> -		p = __alloc_microcode_buf(data, size);
> -		if (IS_ERR(p))
> +		p = memdup_patch(data, size);
> +		if (IS_ERR(p)) {
>  			pr_err("Error allocating buffer for %p\n", data);
> -		else
> -			list_add_tail(&p->plist, &microcode_cache);
> +			return;
> +		}
> +		list_add_tail(&p->plist, &microcode_cache);
>  	}

The static checker is still going to complain about the error pointer
from the loop.  Perhaps we should only set prev_found if the memdup_patch()
inside the loop succeeds?

regards,
dan carpenter
