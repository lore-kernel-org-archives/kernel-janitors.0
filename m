From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Tue, 13 Oct 2015 12:28:03 +0000
Subject: Re: [patch] ASoC: wm8960: harmless underflow in wm8960_put_deemph()
Message-Id: <20151013122803.GH8805@ck-lbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151013070919.GD31537@mwanda>
In-Reply-To: <20151013070919.GD31537@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Zidan Wang <zidan.wang@freescale.com>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, patches@opensource.wolfsonmicro.com, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Tue, Oct 13, 2015 at 10:09:19AM +0300, Dan Carpenter wrote:
> We should only accept "deemph" values of zero and one, but by mistake we
> accept negatives as well.  It's harmless but let's clean it up anyway.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
