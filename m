From: Yang Jie <yang.jie@linux.intel.com>
Date: Thu, 07 Apr 2016 01:21:02 +0000
Subject: Re: [alsa-devel] [patch] ASoC: Intel: sst: fix a loop timeout in sst_hsw_stream_reset()
Message-Id: <5705B5FE.8030105@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160406113606.GA23032@mwanda>
In-Reply-To: <20160406113606.GA23032@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>


On 2016年04月06日 19:36, Dan Carpenter wrote:
> In the original code we ended the loop with tries set to -1 instead of
> zero.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jie Yang <yang.jie@intel.com>

Dan, thanks for finding and correcting it.

Thanks,
~Keyon

> ---
> Not tested.
>
> diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
> index ac60f13..9156522 100644
> --- a/sound/soc/intel/haswell/sst-haswell-ipc.c
> +++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
> @@ -1345,7 +1345,7 @@ int sst_hsw_stream_reset(struct sst_hsw *hsw, struct sst_hsw_stream *stream)
>   		return 0;
>
>   	/* wait for pause to complete before we reset the stream */
> -	while (stream->running && tries--)
> +	while (stream->running && --tries)
>   		msleep(1);
>   	if (!tries) {
>   		dev_err(hsw->dev, "error: reset stream %d still running\n",
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
