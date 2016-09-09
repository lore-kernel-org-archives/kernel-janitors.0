From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 09 Sep 2016 11:30:44 +0000
Subject: Re: [PATCH v3 3/3] intel-mid: Move boundry check to the start of init code
Message-Id: <1473420644.11323.128.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
         <d1643b61f9d5b6fe7d1b168341d9b1e89696c43b.1473386382.git.sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <d1643b61f9d5b6fe7d1b168341d9b1e89696c43b.1473386382.git.sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com

On Thu, 2016-09-08 at 19:07 -0700, Kuppuswamy Sathyanarayanan wrote:
> Moved the instance boundary check to the start of the pcal9555a
> platform init code. This will prevent unnecessary initialization
> on instance boundary error.

I don't see how it makes any better.

I would drop this patch.

> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@
> linux.intel.com>
> ---
>  arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c | 12
> ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/platform/intel-
> mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-
> mid/device_libs/platform_pcal9555a.c
> index cde764e..4e5dd95 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
> @@ -34,6 +34,12 @@ static void __init *pcal9555a_platform_data(void
> *info)
>  	char intr_pin_name[SFI_NAME_LEN + 1];
>  	int gpio_base, intr;
>  
> +	if (nr >= PCAL9555A_NUM) {
> +		pr_err("%s: Too many instances, only %d supported\n",
> __func__,
> +		       PCAL9555A_NUM);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
>  	snprintf(base_pin_name, sizeof(base_pin_name), "%s_base",
> type);
>  	snprintf(intr_pin_name, sizeof(intr_pin_name), "%s_int",
> type);
>  
> @@ -47,12 +53,6 @@ static void __init *pcal9555a_platform_data(void
> *info)
>  		return NULL;
>  	}
>  
> -	if (nr >= PCAL9555A_NUM) {
> -		pr_err("%s: Too many instances, only %d supported\n",
> __func__,
> -		       PCAL9555A_NUM);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
>  	pcal9555a = &pcal9555a_pdata[nr++];
>  	pcal9555a->gpio_base = gpio_base;
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
