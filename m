From: Michal Simek <michal.simek@xilinx.com>
Date: Tue, 18 Aug 2020 06:40:25 +0000
Subject: Re: [PATCH] sound: remove duplicate "the the" phrase in Kconfig text
Message-Id: <9390b757-2240-7208-3d8f-b337428c5685@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200817224706.6139-1-colin.king@canonical.com>
In-Reply-To: <20200817224706.6139-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@xilinx.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 18. 08. 20 0:47, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of occurrences of "the the" in the Kconfig
> text. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/xilinx/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/xilinx/Kconfig b/sound/soc/xilinx/Kconfig
> index 1d3586b68db7..5bd2730aab76 100644
> --- a/sound/soc/xilinx/Kconfig
> +++ b/sound/soc/xilinx/Kconfig
> @@ -9,14 +9,14 @@ config SND_SOC_XILINX_I2S
>  	  encapsulates PCM in AES format and sends AES data.
>  
>  config SND_SOC_XILINX_AUDIO_FORMATTER
> -	tristate "Audio support for the the Xilinx audio formatter"
> +	tristate "Audio support for the Xilinx audio formatter"
>  	help
>  	  Select this option to enable Xilinx audio formatter
>  	  support. This provides DMA platform device support for
>  	  audio functionality.
>  
>  config SND_SOC_XILINX_SPDIF
> -	tristate "Audio support for the the Xilinx SPDIF"
> +	tristate "Audio support for the Xilinx SPDIF"
>  	help
>  	  Select this option to enable Xilinx SPDIF Audio.
>  	  This provides playback and capture of SPDIF audio in
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
