From: walter harms <wharms@bfs.de>
Date: Fri, 12 Feb 2010 13:28:16 +0000
Subject: Re: [patch] staging: vt6655: add missing curly braces
Message-Id: <4B755770.5060301@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100212114801.GA5975@bicker>
In-Reply-To: <20100212114801.GA5975@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Dan Carpenter schrieb:
> It's clear from the indent levels and the context that there are supposed to
> be curly braces here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index db78614..bf4fd49 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -2788,16 +2788,18 @@ void CARDvUpdateBasicTopRate (PVOID pDeviceHandler)
>  
>       //Determines the highest basic rate.
>       for (ii = RATE_54M; ii >= RATE_6M; ii --) {
> -         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) )
> +         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) ) {
>               byTopOFDM = ii;
>               break;
> +         }
>       }
>       pDevice->byTopOFDMBasicRate = byTopOFDM;
>  
>       for (ii = RATE_11M;; ii --) {
> -         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) )
> +         if ( (pDevice->wBasicRate) & ((WORD)(1<<ii)) ) {
>               byTopCCK = ii;
>               break;
> +         }
>           if (ii = RATE_1M)
>              break;
>       }


this is a realy nice catch :)
NTL i guess the code is looking for the highest bit that could be replace
with kernel code. (ffs() ?)

just my 2 cents,
 wh
