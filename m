From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 19:17:32 +0000
Subject: Re: [patch] ASoC: fsl: add an error check
Message-Id: <20150610191732.GC11734@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150610153723.GB10549@mwanda>
 <20150610165544.GA8552@Asurada>
In-Reply-To: <20150610165544.GA8552@Asurada>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@tabi.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org

> Could you please use an subject like:
> ASoC: imx-wm8962: Add a missing error check
> (Since it only applies to this file)
> 

I have been meaning to say something about this.

This is sort of a recurrent problem for me because I'm often the first
person to touch a driver after it's added.  I just copied your patch
prefix from 8de2ae2a7f1f ('ASoC: fsl: add imx-wm8962 machine driver').
Really you should also have used "ASoC: imx-wm8962:" as well.

This is the third new driver today where I have faced this situation.

regards,
dan carpenter

