From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 18:37:39 +0000
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-Id: <20201202183739.GP2767@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c5gjZO7YN/CFsq@mwanda>
 <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
In-Reply-To: <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

On Wed, Dec 02, 2020 at 03:54:53PM +0000, Srinivas Kandagatla wrote:
> Thanks Dan for the patch!
> 
> Do you use any tools to do this checks?
> 

Yeah.  This was a Smatch warning:

sound/soc/codecs/lpass-va-macro.c:847 va_macro_hw_params() warn: always true condition '(decimator >= 0) => (0-u32max >= 0)'

But every static checker will complain about these.

regards,
dan carpenter
