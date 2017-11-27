From: Brian Austin <brian.austin@cirrus.com>
Date: Mon, 27 Nov 2017 14:53:10 +0000
Subject: Re: [PATCH 0/2] ASoC: cs35l32: Adjustments for cs35l32_i2c_probe()
Message-Id: <a0aa7fcd-c80d-4eb3-b3de-5b412dbfbdd7@EX3.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <caf22f25-6c27-b869-89e8-ef2904a2baf2@users.sourceforge.net>
In-Reply-To: <caf22f25-6c27-b869-89e8-ef2904a2baf2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Mark Brown <broonie@kernel.org>

On Wed, 22 Nov 2017, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 22 Nov 2017 20:49:45 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete two error messages for a failed memory allocation
>   Improve two size determinations
> 
>  sound/soc/codecs/cs35l32.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> -- 
> 2.15.0
> 
> 
Sorry for the company notification that this is an external email. Very 
clever indeed

For the Series, Thanks
Acked-by: Brian Austin <brian.austin@cirrus.com>
