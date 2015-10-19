From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 19 Oct 2015 12:01:42 +0000
Subject: Re: [patch v2] ALSA: firewire-tascam: off by one in identify_model()
Message-Id: <s5ha8rf3w49.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5622EF20.6010708@sakamocchi.jp>
	<20151019112927.GA31691@mwanda>
In-Reply-To: <20151019112927.GA31691@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org

On Mon, 19 Oct 2015 13:29:27 +0200,
Dan Carpenter wrote:
> 
> Let's leave space for the NUL char otherwise the static checkers
> complain that we go beyond the end of the array.
> 
> Fixes: 53b3ffee7885 ('ALSA: firewire-tascam: change device probing processing') 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I truncated the last char in v1 instead of making the buffer larger

Applied, thanks.


Takashi

> 
> diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
> index c6747a4..79cb9e9 100644
> --- a/sound/firewire/tascam/tascam.c
> +++ b/sound/firewire/tascam/tascam.c
> @@ -40,7 +40,7 @@ static int identify_model(struct snd_tscm *tscm)
>  {
>  	struct fw_device *fw_dev = fw_parent_device(tscm->unit);
>  	const u32 *config_rom = fw_dev->config_rom;
> -	char model[8];
> +	char model[9];
>  	unsigned int i;
>  	u8 c;
>  
> 
