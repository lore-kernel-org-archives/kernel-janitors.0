From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 21 Jun 2019 03:38:17 +0000
Subject: Re: [PATCH -next] ASoC: SOF: Intel: hda: remove duplicated include from hda.c
Message-Id: <4a40d713-72a6-769a-1245-8768fac2411c@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190620145709.122498-1-yuehaibing@huawei.com>
In-Reply-To: <20190620145709.122498-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 6/20/19 4:57 PM, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/intel/hda.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 51c1c1787de7..7f665392618f 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -19,7 +19,6 @@
>   #include <sound/hda_register.h>
>   
>   #include <linux/module.h>
> -#include <sound/hdaudio_ext.h>
>   #include <sound/sof.h>
>   #include <sound/sof/xtensa.h>
>   #include "../ops.h"
> 
> 
> 
> 
> 
