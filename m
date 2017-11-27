From: Brian Austin <brian.austin@cirrus.com>
Date: Mon, 27 Nov 2017 14:57:40 +0000
Subject: Re: [PATCH 0/2] ASoC: cs42l52: Adjustments for cs42l52_i2c_probe()
Message-Id: <6e8b4684-7b29-43a9-9ef5-c7062f4939df@EX3.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
In-Reply-To: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Mark Brown <broonie@kernel.org>

On Wed, 22 Nov 2017, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 22 Nov 2017 22:15:43 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete an error message for a failed memory allocation
>   Improve two size determinations
> 
>  sound/soc/codecs/cs42l52.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> -- 
> 2.15.0
> 
> 
For the Series, Thanks
Acked-by: Brian Austin <brian.austin@cirrus.com>
