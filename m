From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 22 Feb 2017 06:59:57 +0000
Subject: Re: [PATCH] ALSA: emu10k1: Remove cast from memory allocation
Message-Id: <s5h7f4ioglu.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1487746036-18181-1-git-send-email-me@tobin.cc>
In-Reply-To: <1487746036-18181-1-git-send-email-me@tobin.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tobin C. Harding" <me@tobin.cc>
Cc: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 22 Feb 2017 07:47:16 +0100,
Tobin C. Harding wrote:
> 
> Coccinelle emits multiple WARNING: casting value returned by memory allocation
> function to (u_int32_t __user *) is useless.
> 
> Remove unnecessary cast.
> 
> Signed-off-by: Tobin C. Harding <me@tobin.cc>

__user annotation requires the explicit cast.


Takashi


> ---
>  sound/pci/emu10k1/emufx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
> index 56fc47b..8a39a6f 100644
> --- a/sound/pci/emu10k1/emufx.c
> +++ b/sound/pci/emu10k1/emufx.c
> @@ -1186,8 +1186,8 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
>  	if (!icode)
>  		return err;
>  
> -	icode->gpr_map = (u_int32_t __user *) kcalloc(512 + 256 + 256 + 2 * 1024,
> -						      sizeof(u_int32_t), GFP_KERNEL);
> +	icode->gpr_map = kcalloc(512 + 256 + 256 + 2 * 1024,
> +				sizeof(u_int32_t), GFP_KERNEL);
>  	if (!icode->gpr_map)
>  		goto __err_gpr;
>  	controls = kcalloc(SND_EMU10K1_GPR_CONTROLS,
> @@ -1824,8 +1824,8 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
>  	if (!icode)
>  		return err;
>  
> -	icode->gpr_map = (u_int32_t __user *) kcalloc(256 + 160 + 160 + 2 * 512,
> -						      sizeof(u_int32_t), GFP_KERNEL);
> +	icode->gpr_map = kcalloc(256 + 160 + 160 + 2 * 512,
> +				sizeof(u_int32_t), GFP_KERNEL);
>  	if (!icode->gpr_map)
>  		goto __err_gpr;
>  
> -- 
> 2.7.4
> 
> 
