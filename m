From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 May 2014 17:30:09 +0000
Subject: Re: [patch] ASoC: wm0010: set error code on allocation failure
Message-Id: <20140509173009.GL26890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140509115538.GB32027@mwanda>
 <20140509161808.GE25203@opensource.wolfsonmicro.com>
In-Reply-To: <20140509161808.GE25203@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, patches@opensource.wolfsonmicro.com, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Fri, May 09, 2014 at 05:18:08PM +0100, Charles Keepax wrote:
> On Fri, May 09, 2014 at 02:55:38PM +0300, Dan Carpenter wrote:
> > We should return -ENOMEM if the kzalloc() fails instead of returning
> > -ENOMEM.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
> > index 71ce315..8dac6c5 100644
> > --- a/sound/soc/codecs/wm0010.c
> > +++ b/sound/soc/codecs/wm0010.c
> > @@ -682,6 +682,7 @@ static int wm0010_boot(struct snd_soc_codec *codec)
> >  		if (!img_swap) {
> >  			dev_err(codec->dev,
> >  				"Failed to allocate image buffer\n");
> > +			ret = -ENOMEM;
> 
> No need to set this here, it is set 12 lines earlier. I agree the
> current code is not the most clear,

Oops.  That was my bad.  The code is actually totally clear, it was just
sloppiness on my part.  Sorry for that.

regards,
dan carpenter

