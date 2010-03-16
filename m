From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 16 Mar 2010 06:53:36 +0000
Subject: Re: [patch] sequencer: clean up remove bogus check
Message-Id: <s5haau8iwpb.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100316064623.GA5331@bicker>
In-Reply-To: <20100316064623.GA5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Tue, 16 Mar 2010 09:46:23 +0300,
Dan Carpenter wrote:
> 
> A few lines earlier bend is limited to 2399.  So semitones is always
> less than 24 here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied now.  Thanks.
(That range check is even wrong since the array size is 24...)


Takashi

> diff --git a/sound/oss/sequencer.c b/sound/oss/sequencer.c
> index c798746..e85789e 100644
> --- a/sound/oss/sequencer.c
> +++ b/sound/oss/sequencer.c
> @@ -1631,8 +1631,6 @@ unsigned long compute_finetune(unsigned long base_freq, int bend, int range,
>  	}
>  
>  	semitones = bend / 100;
> -	if (semitones > 99)
> -		semitones = 99;
>  	cents = bend % 100;
>  
>  	amount = (int) (semitone_tuning[semitones] * multiplier * cent_tuning[cents]) / 10000;
> 
