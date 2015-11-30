From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 30 Nov 2015 10:40:42 +0000
Subject: Re: [PATCH] ALSA: i2c: constify snd_i2c_ops structures
Message-Id: <s5hbnabhis5.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448817924-17447-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448817924-17447-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 29 Nov 2015 18:25:24 +0100,
Julia Lawall wrote:
> 
> The snd_i2c_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.


Takashi

> 
> ---
>  include/sound/i2c.h       |    2 +-
>  sound/i2c/i2c.c           |    2 +-
>  sound/pci/ice1712/delta.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/i2c.h b/include/sound/i2c.h
> index d125ff8..835254d 100644
> --- a/include/sound/i2c.h
> +++ b/include/sound/i2c.h
> @@ -66,7 +66,7 @@ struct snd_i2c_bus {
>  		struct snd_i2c_bit_ops *bit;
>  		void *ops;
>  	} hw_ops;		/* lowlevel operations */
> -	struct snd_i2c_ops *ops;	/* midlevel operations */
> +	const struct snd_i2c_ops *ops;	/* midlevel operations */
>  
>  	unsigned long private_value;
>  	void *private_data;
> diff --git a/sound/i2c/i2c.c b/sound/i2c/i2c.c
> index 4677037..ef2a9af 100644
> --- a/sound/i2c/i2c.c
> +++ b/sound/i2c/i2c.c
> @@ -39,7 +39,7 @@ static int snd_i2c_bit_readbytes(struct snd_i2c_device *device,
>  static int snd_i2c_bit_probeaddr(struct snd_i2c_bus *bus,
>  				 unsigned short addr);
>  
> -static struct snd_i2c_ops snd_i2c_bit_ops = {
> +static const struct snd_i2c_ops snd_i2c_bit_ops = {
>  	.sendbytes = snd_i2c_bit_sendbytes,
>  	.readbytes = snd_i2c_bit_readbytes,
>  	.probeaddr = snd_i2c_bit_probeaddr,
> diff --git a/sound/pci/ice1712/delta.c b/sound/pci/ice1712/delta.c
> index 496dbd0..3bfdc78 100644
> --- a/sound/pci/ice1712/delta.c
> +++ b/sound/pci/ice1712/delta.c
> @@ -174,7 +174,7 @@ static int ap_cs8427_probeaddr(struct snd_i2c_bus *bus, unsigned short addr)
>  	return -ENOENT;
>  }
>  
> -static struct snd_i2c_ops ap_cs8427_i2c_ops = {
> +static const struct snd_i2c_ops ap_cs8427_i2c_ops = {
>  	.sendbytes = ap_cs8427_sendbytes,
>  	.readbytes = ap_cs8427_readbytes,
>  	.probeaddr = ap_cs8427_probeaddr,
> 
> 
