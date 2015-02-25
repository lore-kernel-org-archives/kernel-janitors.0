From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 25 Feb 2015 19:09:53 +0000
Subject: Re: [patch] sound/sb_midi: a couple indenting fixes
Message-Id: <s5hvbip3j0e.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225133216.GQ19745@mwanda>
In-Reply-To: <20150225133216.GQ19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 25 Feb 2015 16:32:16 +0300,
Dan Carpenter wrote:
> 
> Let's make things line up a little bit better.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/oss/sb_midi.c b/sound/oss/sb_midi.c
> index f139028..551ee75 100644
> --- a/sound/oss/sb_midi.c
> +++ b/sound/oss/sb_midi.c
> @@ -179,14 +179,14 @@ void sb_dsp_midi_init(sb_devc * devc, struct module *owner)
>  	{
>  		printk(KERN_WARNING "Sound Blaster:  failed to allocate MIDI memory.\n");
>  		sound_unload_mididev(dev);
> -		  return;
> +		return;
>  	}
>  	memcpy((char *) midi_devs[dev], (char *) &sb_midi_operations,
>  	       sizeof(struct midi_operations));
>  
>  	if (owner)
> -			midi_devs[dev]->owner = owner;
> -	
> +		midi_devs[dev]->owner = owner;
> +
>  	midi_devs[dev]->devc = devc;
>  
>  
> 
