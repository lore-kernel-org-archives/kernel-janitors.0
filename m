From: Brian Austin <brian.austin@cirrus.com>
Date: Mon, 27 Nov 2017 14:46:30 +0000
Subject: Re: [EXTERNAL] [PATCH 0/3] ASoC-cs42l73: Adjustments for two function implementations
Message-Id: <4ac4c978-b463-4a96-8b3b-b037b46291e7@EX3.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
In-Reply-To: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Mark Brown <broonie@kernel.org>

On Wed, 22 Nov 2017, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 22 Nov 2017 16:38:32 +0100
> 
> Three update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Delete an error message for a failed memory allocation in cs42l73_i2c_probe()
>   Improve two size determinations in cs42l73_i2c_probe()
>   Fix a typo in two comments
> 
>  sound/soc/codecs/cs42l73.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> -- 
> 2.15.0
> 
> 
For the series, Thanks
Acked-by: Brian Austin <brian.austin@cirrus.com>
