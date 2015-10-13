From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Tue, 13 Oct 2015 12:29:27 +0000
Subject: Re: [patch] ASoC: wm2000: a couple harmless underflows
Message-Id: <20151013122927.GK8805@ck-lbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151013071245.GI31537@mwanda>
In-Reply-To: <20151013071245.GI31537@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, patches@opensource.wolfsonmicro.com, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Tue, Oct 13, 2015 at 10:12:45AM +0300, Dan Carpenter wrote:
> We want these to be zero or one, but by mistake we also accept negative
> values.  It's harmless but we should still clean it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
