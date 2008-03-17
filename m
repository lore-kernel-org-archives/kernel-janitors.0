From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 17 Mar 2008 09:20:34 +0000
Subject: Re: [PATCH 4/7] sound/pci: remove unused variable
Message-Id: <s5hve3lr9jx.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803151703210.24178@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803151703210.24178@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

[Dropped wrong Cc's]

At Sat, 15 Mar 2008 17:03:51 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> The variables change and is_capture are initialized but never used otherwise.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> type T;
> identifier i;
> constant C;
> @@
> 
> (
> extern T i;
> |
> - T i;
>   <+... when != i
> - i = C;
>   ...+>
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  sound/pci/ice1712/pontis.c |    2 --
>  sound/pci/pcxhr/pcxhr.c    |    3 ---
>  2 files changed, 5 deletions(-)
> 
> diff -u -p a/sound/pci/ice1712/pontis.c b/sound/pci/ice1712/pontis.c
> --- a/sound/pci/ice1712/pontis.c 2008-03-12 14:13:15.000000000 +0100
> +++ b/sound/pci/ice1712/pontis.c 2008-03-15 07:32:24.000000000 +0100
> @@ -440,14 +440,12 @@ static int cs_source_put(struct snd_kcon
>  {
>  	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
>  	unsigned char val;
> -	int change = 0;
>  
>  	mutex_lock(&ice->gpio_mutex);
>  	if (ucontrol->value.enumerated.item[0] != ice->gpio.saved[0]) {
>  		ice->gpio.saved[0] = ucontrol->value.enumerated.item[0] & 3;
>  		val = 0x80 | (ice->gpio.saved[0] << 3);
>  		spi_write(ice, CS_DEV, 0x04, val);
> -		change = 1;
>  	}
>  	mutex_unlock(&ice->gpio_mutex);
>  	return 0;

This shouldn't be removed.  This value should be returned from the
function instead.

> diff -u -p a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
> --- a/sound/pci/pcxhr/pcxhr.c 2008-03-12 14:13:15.000000000 +0100
> +++ b/sound/pci/pcxhr/pcxhr.c 2008-03-15 07:36:12.000000000 +0100
> @@ -846,7 +846,6 @@ static int pcxhr_open(struct snd_pcm_sub
>  	struct pcxhr_mgr       *mgr = chip->mgr;
>  	struct snd_pcm_runtime *runtime = subs->runtime;
>  	struct pcxhr_stream    *stream;
> -	int                 is_capture;
>  
>  	mutex_lock(&mgr->setup_mutex);
>  
> @@ -856,12 +855,10 @@ static int pcxhr_open(struct snd_pcm_sub
>  	if( subs->stream = SNDRV_PCM_STREAM_PLAYBACK ) {
>  		snd_printdd("pcxhr_open playback chip%d subs%d\n",
>  			    chip->chip_idx, subs->number);
> -		is_capture = 0;
>  		stream = &chip->playback_stream[subs->number];
>  	} else {
>  		snd_printdd("pcxhr_open capture chip%d subs%d\n",
>  			    chip->chip_idx, subs->number);
> -		is_capture = 1;
>  		if (mgr->mono_capture)
>  			runtime->hw.channels_max = 1;
>  		else

This looks superfluous indeed.  Applied to ALSA tree now.


Thanks,

Takashi
