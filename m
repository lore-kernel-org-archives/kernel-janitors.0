From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Tue, 03 May 2016 07:58:07 +0000
Subject: Re: [patch] ASoC: hdac_hdmi: Potential NULL deref in hdac_hdmi_get_spk_alloc()
Message-Id: <57285A0F.7060603@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160503074258.GA9722@mwanda>
In-Reply-To: <20160503074258.GA9722@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jeeja KP <jeeja.kp@intel.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

On May 03 2016 16:42, Dan Carpenter wrote:
> We intended || here instead of &&.  The original code potentially leads
> to a NULL dereference.
> 
> Fixes: 2889099eb8cd ('ASoC: hdac_hdmi: Register chmap controls and ops')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed.

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
> index 3043120..7e7ff1b 100644
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@ -1609,7 +1609,7 @@ static int hdac_hdmi_get_spk_alloc(struct hdac_device *hdac, int pcm_idx)
>  	struct hdac_hdmi_pcm *pcm = get_hdmi_pcm_from_id(hdmi, pcm_idx);
>  	struct hdac_hdmi_pin *pin = pcm->pin;
>  
> -	if (!pin && !pin->eld.eld_valid)
> +	if (!pin || !pin->eld.eld_valid)
>  		return 0;
>  
>  	return pin->eld.info.spk_alloc;


Regards

Takashi Sakamoto
