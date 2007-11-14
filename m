From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 14 Nov 2007 10:01:11 +0000
Subject: Re: [PATCH 4/4] sound/pci: Drop unnecessary continue
Message-Id: <s5hy7d1du3c.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711140915220.26019@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711140915220.26019@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: perex@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Wed, 14 Nov 2007 09:15:51 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Continue is not needed at the bottom of a loop.
> 
> The semantic patch implementing this change is as follows:
> 
> @@
> @@
> 
> for (...;...;...) {
>    ...
>    if (...) {
>      ...
> -   continue;
>    }
> }
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to ALSA tree.  Thanks.


Takashi

> ---
> 
> diff -u -p -b -B a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
> --- a/sound/pci/intel8x0.c 2007-10-22 11:25:53.000000000 +0200
> +++ b/sound/pci/intel8x0.c 2007-11-13 23:53:44.000000000 +0100
> @@ -2144,7 +2144,6 @@ static int __devinit snd_intel8x0_mixer(
>   				snd_printk(KERN_ERR "Unable to initialize codec #%d\n", i);
>   			if (i = 0)
>   				goto __err;
> -			continue;
>   		}
>   	}
>   	/* tune up the primary codec */
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
