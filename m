From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Sat, 13 Dec 2014 04:45:55 +0000
Subject: Re: [patch 2/2] ALSA: oxfw: fix detect_loud_models() return value
Message-Id: <548BC483.4090703@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141212192810.GB22234@mwanda>
In-Reply-To: <20141212192810.GB22234@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Dec 13 2014 04:28, Dan Carpenter wrote:
> This code causes a static checker warning:
> 
> 	sound/firewire/oxfw/oxfw.c:46 detect_loud_models()
> 	warn: signedness bug returning '(-2)'
> 
> The detect_loud_models() function should return false on falure, so that
> we don't try to set up the loud code for hardware that doesn't support
> it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
> index cf1d0b5..60e5cad 100644
> --- a/sound/firewire/oxfw/oxfw.c
> +++ b/sound/firewire/oxfw/oxfw.c
> @@ -43,7 +43,7 @@ static bool detect_loud_models(struct fw_unit *unit)
>  	err = fw_csr_string(unit->directory, CSR_MODEL,
>  			    model, sizeof(model));
>  	if (err < 0)
> -		return err;
> +		return false;
>  
>  	for (i = 0; i < ARRAY_SIZE(models); i++) {
>  		if (strcmp(models[i], model) = 0)

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
o-takashi@sakamocchi.jp
