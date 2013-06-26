From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 26 Jun 2013 08:37:34 +0000
Subject: Re: [patch] ALSA: ak4xx-adda: info leak in ak4xxx_capture_source_info()
Message-Id: <s5hbo6ts1wx.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130626075220.GA1895@elgon.mountain>
In-Reply-To: <20130626075220.GA1895@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 26 Jun 2013 10:52:20 +0300,
Dan Carpenter wrote:
> 
> "idx" is controled by the user and can be a negative offset into the
> input_names[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied now.


Takashi


> diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
> index cef813d2..ed726d1 100644
> --- a/sound/i2c/other/ak4xxx-adda.c
> +++ b/sound/i2c/other/ak4xxx-adda.c
> @@ -571,7 +571,7 @@ static int ak4xxx_capture_source_info(struct snd_kcontrol *kcontrol,
>  	struct snd_akm4xxx *ak = snd_kcontrol_chip(kcontrol);
>  	int mixer_ch = AK_GET_SHIFT(kcontrol->private_value);
>  	const char **input_names;
> -	int  num_names, idx;
> +	unsigned int num_names, idx;
>  
>  	num_names = ak4xxx_capture_num_inputs(ak, mixer_ch);
>  	if (!num_names)
> 
