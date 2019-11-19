From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 19 Nov 2019 14:23:30 +0000
Subject: Re: [PATCH] ASoC: Intel: mrfld: fix incorrect check on p->sink
Message-Id: <f084c578-2fd5-e090-7d90-1ddffa1e22be@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119113640.166940-1-colin.king@canonical.com>
In-Reply-To: <20191119113640.166940-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>, Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 11/19/19 5:36 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check on p->sink looks bogus, I believe it should be p->source
> since the following code blocks are related to p->source. Fix
> this by replacing p->sink with p->source.
> 
> Addresses-Coverity: ("Copy-paste error")
> Fixes: 24c8d14192cc ("ASoC: Intel: mrfld: add DSP core controls")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> [ Note: this has not been tested ]
> 

wow, nice catch. this dates from October 2014 and was merged in Linux 3.19.

I did look at the entire function and indeed it does not seem logical at 
all and rather an unintentional bad copy-paste, probably undetected 
since changing the gains on capture is less straightforward to test.

	if (stream = SNDRV_PCM_STREAM_PLAYBACK) {
		dev_dbg(dai->dev, "Stream name=%s\n",
				dai->playback_widget->name);
		w = dai->playback_widget;
		snd_soc_dapm_widget_for_each_sink_path(w, p) {
			if (p->connected && !p->connected(w, p->sink))
				continue;
[snip]
		}
	} else {
		dev_dbg(dai->dev, "Stream name=%s\n",
				dai->capture_widget->name);
		w = dai->capture_widget;
		snd_soc_dapm_widget_for_each_source_path(w, p) {
			if (p->connected && !p->connected(w, p->sink))

<< here it doesn't look right to use sink here.

				continue;

This macro snd_soc_dapm_widget_for_each_source_path() is also used in 
the skylake/skl-topology.c but without any source/sink inversion.

I don't think anyone on the Intel side will have time to investigate 
further, and unless someone from the initial contributors states this 
was intentional (Vinod/Sanyog?), we should merge this.

let's see if there's any feedback and if not I'll ack this.


> ---
>   sound/soc/intel/atom/sst-atom-controls.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
> index baef461a99f1..f883c9340eee 100644
> --- a/sound/soc/intel/atom/sst-atom-controls.c
> +++ b/sound/soc/intel/atom/sst-atom-controls.c
> @@ -1333,7 +1333,7 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
>   				dai->capture_widget->name);
>   		w = dai->capture_widget;
>   		snd_soc_dapm_widget_for_each_source_path(w, p) {
> -			if (p->connected && !p->connected(w, p->sink))
> +			if (p->connected && !p->connected(w, p->source))
>   				continue;
>   
>   			if (p->connect &&  p->source->power &&
> 
