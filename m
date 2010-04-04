From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 04 Apr 2010 10:20:01 +0000
Subject: Re: [patch] i2c: cleanup: change parameter to pointer
Message-Id: <s5hpr2fh63y.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100402112923.GJ5265@bicker>
In-Reply-To: <20100402112923.GJ5265@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Fri, 2 Apr 2010 14:29:23 +0300,
Dan Carpenter wrote:
> 
> We actually pass an array of 7 chars not 5.
> This silences a smatch warning.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks.  I applied together with the fx in the declaration part in
include/sound/ak4113.h.


Takashi

> ---
> Compile tested only.  :/
> 
> diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
> index fff62cc..971a84a 100644
> --- a/sound/i2c/other/ak4113.c
> +++ b/sound/i2c/other/ak4113.c
> @@ -70,7 +70,7 @@ static int snd_ak4113_dev_free(struct snd_device *device)
>  }
>  
>  int snd_ak4113_create(struct snd_card *card, ak4113_read_t *read,
> -		ak4113_write_t *write, const unsigned char pgm[5],
> +		ak4113_write_t *write, const unsigned char *pgm,
>  		void *private_data, struct ak4113 **r_ak4113)
>  {
>  	struct ak4113 *chip;
> 
