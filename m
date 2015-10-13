From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Tue, 13 Oct 2015 12:27:11 +0000
Subject: Re: [patch] ASoC: wm8904: harmless underflow in wm8904_put_deemph()
Message-Id: <20151013122711.GF8805@ck-lbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151013070818.GB31537@mwanda>
In-Reply-To: <20151013070818.GB31537@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Alexander Morozov <linux@meltdown.ru>, Mark Brown <broonie@kernel.org>, Bo Shen <voice.shen@atmel.com>

On Tue, Oct 13, 2015 at 10:08:18AM +0300, Dan Carpenter wrote:
> We try to check that "deemph" is zero or one, but because of an
> underflow bug, it can also be negative.  It's fine, negative values are
> handled as non-zero.  But it's messy and static checkers complain so
> let's fix it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
