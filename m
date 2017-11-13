From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Nov 2017 18:30:29 +0000
Subject: Re: [PATCH 1/4] ALSA: cs46xx: Adjust 33 function calls together with a variable assignment
Message-Id: <20171113183029.sudeyhgh7v6buukx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <893b1dc2-d078-9ea6-4ad2-0e0327affddd@users.sourceforge.net>
 <5da69abe-0bcd-e2c3-cb11-04b44b4f8bd2@users.sourceforge.net>
In-Reply-To: <5da69abe-0bcd-e2c3-cb11-04b44b4f8bd2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Fabian Frederick <fabf@skynet.be>, Bhumika Goyal <bhumirks@gmail.com>

On Mon, Nov 13, 2017 at 07:22:30PM +0100, SF Markus Elfring wrote:
> -
> -		if ( (cpcm->pcm_channel = cs46xx_dsp_create_pcm_channel (chip, sample_rate, cpcm, 
> -									 cpcm->hw_buf.addr,
> -									 cpcm->pcm_channel_id)) = NULL) {
> +		cpcm
> +		->pcm_channel = cs46xx_dsp_create_pcm_channel(chip,
                ^^^^^^^^^^^^^
Please don't break it up like this

> +							      sample_rate,
> +							      cpcm,
> +							      cpcm->hw_buf.addr,
> +							      cpcm
> +							      ->pcm_channel_id);
                                                              ^^^^^^^^^^^^^^^^
or this.  It's better to go over 80 characters than to do that.

regards,
dan carpenter

