From: Brian Austin <brian.austin@cirrus.com>
Date: Mon, 27 Nov 2017 14:47:26 +0000
Subject: Re: [EXTERNAL] [PATCH 0/2] ASoC: cs35l32: Adjustments for cs35l32_i2c_probe()
Message-Id: <d04fe61d-f56d-4faf-a337-aa131b7513a2@EX3.ad.cirrus.com>
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
For the series, Thanks
Acked-by: Brian Austin <brian.austin@cirrus.com>
