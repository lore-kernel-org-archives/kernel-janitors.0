From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 13 Feb 2010 09:36:37 +0000
Subject: Re: [patch] staging: vt6655: rewrite CARDvUpdateBasicTopRate()
Message-Id: <4B7672A5.80308@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100213080317.GJ14210@bicker>
In-Reply-To: <20100213080317.GJ14210@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 02/13/2010 09:03 AM, Dan Carpenter wrote:
> Originally, I wrote a patch to add some missing curly braces, but Walter
> Harms suggested that I should just rewrite the whole function to use the
> kernel version of ffs().
> 
> It is odd to subtract one from the result of ffs() but that was present
> in the original code as well (once you add the missing curly braces).
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This patch replaces my previous patch.  I don't have the hardware to 
> actually test this change.  :/
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index db78614..3a1f2be 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -2780,28 +2780,32 @@ void vUpdateIFS (PVOID pDeviceHandler)
>      VNSvOutPortB(pDevice->PortOffset + MAC_REG_CWMAXMIN0, (BYTE)byMaxMin);
>  }
>  
> +static int top_OFDM_basic_rate(u16 basic_rate)
> +{
> +	int rate;
> +
> +	rate = ffs(basic_rate) - 1;
> +	if (rate > RATE_54M || rate < RATE_6M)
> +		return RATE_24M;
> +	return rate;
> +}
> +
> +static int top_CCK(u16 basic_rate)
> +{
> +	int rate;
> +
> +	rate = ffs(basic_rate) - 1;
> +	if (rate > RATE_11M || rate < 0)
> +		return RATE_1M;
> +	return rate;
> +}
> +
>  void CARDvUpdateBasicTopRate (PVOID pDeviceHandler)
>  {
> -    PSDevice pDevice = (PSDevice) pDeviceHandler;
> -    BYTE byTopOFDM = RATE_24M, byTopCCK = RATE_1M;
> -    BYTE ii;
> -
> -     //Determines the highest basic rate.
> -     for (ii = RATE_54M; ii >= RATE_6M; ii --) {
> -         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) )
> -             byTopOFDM = ii;
> -             break;
> -     }
> -     pDevice->byTopOFDMBasicRate = byTopOFDM;
> -
> -     for (ii = RATE_11M;; ii --) {
> -         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) )
> -             byTopCCK = ii;
> -             break;
> -         if (ii = RATE_1M)
> -            break;
> -     }

Hmm, but this is different from ffs in that it starts from higher bits
and go down and hence finds the highest possible rate (there may be more
basic rates). Your patch selects the lowest possible one.

You cannot use ffs and fls here.

-- 
js
