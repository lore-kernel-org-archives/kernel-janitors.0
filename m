From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Sep 2019 14:27:36 +0000
Subject: Re: [PATCH] ASoC: amd: acp3x: clean up an indentation issue
Message-Id: <20190927142552.GH27389@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927103858.631-1-colin.king@canonical.com>
 <729ae953-b78a-9452-e8b3-3583a21a1295@canonical.com>
In-Reply-To: <729ae953-b78a-9452-e8b3-3583a21a1295@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>

On Fri, Sep 27, 2019 at 11:43:31AM +0100, Colin Ian King wrote:
> On 27/09/2019 11:38, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a return statement that is indented too deeply, remove
> > the extraneous tab.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
> > index bc4dfafdfcd1..ea57088d50ce 100644
> > --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> > +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> > @@ -631,7 +631,7 @@ static int acp3x_audio_probe(struct platform_device *pdev)
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	if (!res) {
> >  		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
> > -			return -ENODEV;
> > +		return -ENODEV;
> >  	}
> >  
> >  	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> > 
> Oops, I've sent this fix before. ignore. apologies.

Haha.  I used to do this all the time.  Now my QC script searches my
outbox.  I still send duplicates sometimes if I'm travelling and forget
to copy my outbox over.

regards,
dan carpenter
