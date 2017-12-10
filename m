From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 10 Dec 2017 01:52:00 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: nuc900: Fix platform_get_irq() error checking some more
Message-Id: <20171210015200.gr4mxzqgzyvamxui@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209115203.pdtdfnmzwz6zpjqs@mwanda>
 <5A2BE644.3070009@gmail.com> <20171209172732.GF15660@piout.net>
In-Reply-To: <20171209172732.GF15660@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, arvindY <arvind.yadav.cs@gmail.com>

On Sat, Dec 09, 2017 at 06:27:32PM +0100, Alexandre Belloni wrote:
> > > diff --git a/sound/soc/nuc900/nuc900-ac97.c b/sound/soc/nuc900/nuc900-ac97.c
> > > index 5e4fbd2d3479..71fce7c85c93 100644
> > > --- a/sound/soc/nuc900/nuc900-ac97.c
> > > +++ b/sound/soc/nuc900/nuc900-ac97.c
> > > @@ -345,11 +345,10 @@ static int nuc900_ac97_drvprobe(struct platform_device *pdev)
> > >   		goto out;
> > >   	}
> > > -	nuc900_audio->irq_num = platform_get_irq(pdev, 0);
> > > -	if (nuc900_audio->irq_num <= 0) {
> > > -		ret = nuc900_audio->irq_num < 0 ? nuc900_audio->irq_num : -EBUSY;
> > > +	ret = platform_get_irq(pdev, 0);
> > > +	if (ret < 0)
> 
> The <= 0 was ok, see:
> https://lkml.org/lkml/2017/11/18/41
> 

Yeah, but is it ever going to return 0?  That seems like a design error
and also really crap commenting if so.

regards,
dan carpenter

