From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 22 Feb 2019 09:22:48 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: cs35l36: Fix an IS_ERR() vs NULL checking bug
Message-Id: <20190222092248.GB130153@ediswmail.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222063151.GC30993@kadam>
In-Reply-To: <20190222063151.GC30993@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, James Schulman <james.schulman@cirrus.com>, Mark Brown <broonie@kernel.org>

On Fri, Feb 22, 2019 at 09:31:51AM +0300, Dan Carpenter wrote:
> The irq_get_irq_data() function doesn't return error pointers, it
> returns NULL.
> 
> Fixes: 6ba9dd6c893b ("ASoC: cs35l36: Add support for Cirrus CS35L36 Amplifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
