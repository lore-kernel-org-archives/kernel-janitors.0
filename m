From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 17 Oct 2015 10:12:17 +0000
Subject: Re: [patch 2/2] ALSA: firewire-tascam: off by one in handle_midi_tx()
Message-Id: <s5hio65dcse.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151015181711.GB3163@mwanda>
In-Reply-To: <20151015181711.GB3163@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org

On Thu, 15 Oct 2015 20:17:11 +0200,
Dan Carpenter wrote:
> 
> My static checker complains because tscm->spec->midi_capture_ports is
> either 2 or 4 but the tscm->tx_midi_substreams[] array has 4 elements so
> this is possibly off by one.  I have looked at the code and I think it
> should be >= instead of > as well.
> 
> Fixes: 107cc0129a68 ('ALSA: firewire-tascam: add support for incoming MIDI messages by asynchronous transaction')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/firewire/tascam/tascam-transaction.c b/sound/firewire/tascam/tascam-transaction.c
> index 45c3ce3..d4f64ae 100644
> --- a/sound/firewire/tascam/tascam-transaction.c
> +++ b/sound/firewire/tascam/tascam-transaction.c
> @@ -158,7 +158,7 @@ static void handle_midi_tx(struct fw_card *card, struct fw_request *request,
>  
>  		port = b[0] >> 4;
>  		/* TODO: support virtual MIDI ports. */
> -		if (port > tscm->spec->midi_capture_ports)
> +		if (port >= tscm->spec->midi_capture_ports)
>  			goto end;
>  
>  		/* Assume the message length. */
> 
