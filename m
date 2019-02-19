From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 19 Feb 2019 15:59:07 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: dapm: Potential small memory leak in dapm_cnew_widget()
Message-Id: <d9db594e-7f29-b663-5920-aaab6e77d553@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219120427.GA26719@kadam>
In-Reply-To: <20190219120427.GA26719@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>


On 2/19/19 6:04 AM, Dan Carpenter wrote:
> We should free "w" on the error path.
>
> Fixes: 199ed3e81c49 ("ASoC: dapm: fix use-after-free issue with dailink sname")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, thanks.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>   sound/soc/soc-dapm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index dea6fc2353e4..1ec06ef6d161 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -332,8 +332,10 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
>   	 */
>   	if (_widget->sname) {
>   		w->sname = kstrdup_const(_widget->sname, GFP_KERNEL);
> -		if (!w->sname)
> +		if (!w->sname) {
> +			kfree(w);
>   			return NULL;
> +		}
>   	}
>   	return w;
>   }
