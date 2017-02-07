From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:50:08 +0000
Subject: Re: [patch] ASoC: sun4i-i2s: remove some dead code
Message-Id: <20170207135008.GL11103@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131934.GD28207@mwanda>
 <20170207134215.f47cufvs7tngrabk@lukather>
In-Reply-To: <20170207134215.f47cufvs7tngrabk@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: alsa-devel@alsa-project.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>

On Tue, Feb 07, 2017 at 02:42:15PM +0100, Maxime Ripard wrote:
> > -	if (!IS_ERR(i2s->rst)) {
> > -		ret = reset_control_deassert(i2s->rst);
> > -		if (ret) {
> > -			dev_err(&pdev->dev,
> > -				"Failed to deassert the reset control\n");
> > -			return -EINVAL;
> > -		}
> > +	ret = reset_control_deassert(i2s->rst);
> > +	if (ret) {
> > +		dev_err(&pdev->dev,
> > +			"Failed to deassert the reset control\n");
> > +		return -EINVAL;
> 
> In the case where has_reset is false, rst is NULL and will trigger a
> WARN_ON in reset_control_deassert.
> 

No it won't.  reset_control_deassert(NULL) just returns success
immediately.

> The proper fix would be to move it in the previous if block, or to
> change the IS_ERR check for a NULL check.

We could move it as a clean up but the current code works.  Checking for
NULL is wrong.

regards,
dan carpenter


