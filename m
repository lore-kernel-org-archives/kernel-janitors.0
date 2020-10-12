From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Date: Mon, 12 Oct 2020 07:14:54 +0000
Subject: RE: [PATCH 3/8] ASoC: Intel: bytcr_rt5651: use semicolons rather than commas to separate statements
Message-Id: <225ad3480553428bbf50e34322c8688a@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
 <1602407979-29038-4-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-4-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, =?windows-1257?Q?Valdis_Kl=E7tnieks?= <valdis.kletnieks@vt.edu>, Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2020-10-11 11:19 AM, Julia Lawall wrote:
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks,
Czarek

> ---
>   sound/soc/intel/boards/bytcr_rt5651.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index 688b5e0a49e3..64d3fc4a3225 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -143,7 +143,7 @@ static int byt_rt5651_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai,
>   
>   	/* Configure the PLL before selecting it */
>   	if (!(byt_rt5651_quirk & BYT_RT5651_MCLK_EN)) {
> -		clk_id = RT5651_PLL1_S_BCLK1,
> +		clk_id = RT5651_PLL1_S_BCLK1;
>   		clk_freq = rate * bclk_ratio;
>   	} else {
>   		clk_id = RT5651_PLL1_S_MCLK;
>
