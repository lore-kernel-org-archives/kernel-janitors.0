From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 25 May 2019 06:25:10 +0000
Subject: Re: [PATCH][next] ASoC: cx2072x: fix integer overflow on unsigned int multiply
Message-Id: <s5hlfyvaw55.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190524222551.26573-1-colin.king@canonical.com>
In-Reply-To: <20190524222551.26573-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 25 May 2019 00:25:51 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where frac_div larger than 96 the result of an unsigned
> multiplication overflows an unsigned int.  For example, this can
> happen when the sample_rate is 192000 and pll_input is 122.  Fix
> this by casing the first term of the mutiply to a u64. Also remove
> the extraneous parentheses around the expression.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: a497a4363706 ("ASoC: Add support for Conexant CX2072X CODEC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
