From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 17 Oct 2015 10:12:08 +0000
Subject: Re: [patch 1/2] ALSA: firewire-tascam: fix an LED bug
Message-Id: <s5hk2qldcsn.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151015181630.GA3163@mwanda>
In-Reply-To: <20151015181630.GA3163@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org

On Thu, 15 Oct 2015 20:16:30 +0200,
Dan Carpenter wrote:
> 
> We recently tried to add some new code to support turning the LED on and
> off but the code in snd_tscm_transaction_reregister() is unreachable.
> 
> Fixes: e65e2cb99e44 ('ALSA: firewire-tascam: Turn on/off FireWire LED')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/firewire/tascam/tascam-transaction.c b/sound/firewire/tascam/tascam-transaction.c
> index 1c9a88b..45c3ce3 100644
> --- a/sound/firewire/tascam/tascam-transaction.c
> +++ b/sound/firewire/tascam/tascam-transaction.c
> @@ -249,7 +249,7 @@ int snd_tscm_transaction_reregister(struct snd_tscm *tscm)
>  
>  	/* Turn on messaging. */
>  	reg = cpu_to_be32(0x00000001);
> -	return snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
> +	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
>  				  TSCM_ADDR_BASE + TSCM_OFFSET_MIDI_TX_ON,
>  				  &reg, sizeof(reg), 0);
>  	if (err < 0)
> 
