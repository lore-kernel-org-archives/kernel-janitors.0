From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Tue, 13 Oct 2015 12:28:47 +0000
Subject: Re: [patch] ASoC: wm8903: harmless underflow in wm8903_put_deemph()
Message-Id: <20151013122847.GI8805@ck-lbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151013071018.GF31537@mwanda>
In-Reply-To: <20151013071018.GF31537@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Axel Lin <axel.lin@ingics.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, abdoulaye berthe <berthe.ab@gmail.com>, patches@opensource.wolfsonmicro.com, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Tue, Oct 13, 2015 at 10:10:18AM +0300, Dan Carpenter wrote:
> Valid values for "deemph" are zero and one, but we accidentally allow
> negative values as well.  It's harmless, but static checkers complain
> and we may as well clean it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
