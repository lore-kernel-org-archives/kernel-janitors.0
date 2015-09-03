From: Kenneth Westfield <kwestfie@codeaurora.org>
Date: Thu, 03 Sep 2015 21:33:08 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: qcom: change PTR_ERR argument
Message-Id: <20150903213307.GB9014@kwestfie-linux.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
 <55E35169.3000703@bfs.de>
In-Reply-To: <55E35169.3000703@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

On Sun, Aug 30, 2015 at 11:54:33AM -0700, walter harms wrote:
> Am 30.08.2015 20:05, schrieb Julia Lawall:
> >  		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
> >  			dev_err(&pdev->dev,
> >  				"%s() error getting mi2s-bit-clk: %ld\n",
> > -				__func__,
> PTR_ERR(drvdata->mi2s_bit_clk[i]));
> > +				__func__,
> > +				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
> >  			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
> >  		}
> >  	}
> > 
> 
> just a note:
> using a shorter name instead of drvdata->mi2s_bit_clk[dai_id] whould help
> to make the code
> more readable (yes, the other code is alike). something like:
> 
> struct clk *tmp =  devm_clk_get(&pdev->dev,clk_name);
> 
> if (IS_ERR(tmp)) {
> 	dev_err(&pdev->dev,"%s() error getting mi2s-bit-clk:
> %ld\n",__func__, PTR_ERR(tmp));
>         return PTR_ERR(tmp);
> }
> drvdata->mi2s_bit_clk[dai_id]=tmp;

Yes, it would make the code more readable.

> 
> 
> just one minor:
> the dev_warn() just before says: " error getting mi2s-osr-clk" may be it
> should be "warnig ..."
> That will make it more easy to rep for real error in a log.

"error [gs]etting" could be re-phrased to "could not [gs]et".  The term
"error" was not meant to indicate the log level, but evidently, can
cause some confusion for someone reading the logs.

-- 
Kenneth Westfield
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
a Linux Foundation Collaborative Project
