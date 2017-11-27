From: Brian Austin <brian.austin@cirrus.com>
Date: Mon, 27 Nov 2017 14:50:50 +0000
Subject: Re: [PATCH 0/2] ASoC: cs35l34: Adjustments for cs35l34_i2c_probe()
Message-Id: <33c417da-fd14-4497-bc97-be45f997a815@EX3.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f524230c-6dbd-cb66-4c61-570b5ef185c1@users.sourceforge.net>
In-Reply-To: <f524230c-6dbd-cb66-4c61-570b5ef185c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Mark Brown <broonie@kernel.org>

On Wed, 22 Nov 2017, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 22 Nov 2017 21:23:45 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete two error messages for a failed memory allocation
>   Improve two size determinations
> 
>  sound/soc/codecs/cs35l34.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> -- 
> 2.15.0
> 
> 
For the series, Thanks
Acked-by: Brian Austin <brian.austin@cirrus.com>
