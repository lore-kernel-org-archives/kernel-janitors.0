From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Feb 2013 08:53:51 +0000
Subject: Re: [patch] ALSA: ice1712: fix boundary check in snd_wm8766_write()
Message-Id: <s5h8v705wtc.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130207082848.GB18610@elgon.mountain>
In-Reply-To: <20130207082848.GB18610@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Ondrej Zary <linux@rainbow-software.org>

At Thu, 7 Feb 2013 11:28:48 +0300,
Dan Carpenter wrote:
> 
> The wm->regs[] array has WM8766_REG_COUNT (16) elements not
> WM8766_REG_RESET (31).
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a static checker thing, I can't test it.

Thanks, applied it now.


Takashi

> 
> diff --git a/sound/pci/ice1712/wm8766.c b/sound/pci/ice1712/wm8766.c
> index 8072ade..e473f8a 100644
> --- a/sound/pci/ice1712/wm8766.c
> +++ b/sound/pci/ice1712/wm8766.c
> @@ -31,7 +31,7 @@
>  
>  static void snd_wm8766_write(struct snd_wm8766 *wm, u16 addr, u16 data)
>  {
> -	if (addr < WM8766_REG_RESET)
> +	if (addr < WM8766_REG_COUNT)
>  		wm->regs[addr] = data;
>  	wm->ops.write(wm, addr, data);
>  }
> 
