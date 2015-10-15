From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 15 Oct 2015 08:02:09 +0000
Subject: Re: [patch] ALSA: oss: underflow in snd_mixer_oss_proc_write()
Message-Id: <s5h1tcwk1a6.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151015070141.GA6422@mwanda>
In-Reply-To: <20151015070141.GA6422@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Jie Yang <yang.jie@intel.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 15 Oct 2015 09:01:42 +0200,
Dan Carpenter wrote:
> 
> We cap the upper bound of "idx" but not the negative side.  Let's make
> it unsigned to fix this.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
> index a99f720..7a8c79d 100644
> --- a/sound/core/oss/mixer_oss.c
> +++ b/sound/core/oss/mixer_oss.c
> @@ -1177,7 +1177,8 @@ static void snd_mixer_oss_proc_write(struct snd_info_entry *entry,
>  	struct snd_mixer_oss *mixer = entry->private_data;
>  	char line[128], str[32], idxstr[16];
>  	const char *cptr;
> -	int ch, idx;
> +	unsigned int idx;
> +	int ch;
>  	struct snd_mixer_oss_assign_table *tbl;
>  	struct slot *slot;
>  
> 
