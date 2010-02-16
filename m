From: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 16 Feb 2010 11:02:56 +0000
Subject: Re: bug list: range checking issues
Message-Id: <alpine.LNX.2.00.1002161201140.28127@eeebox2.perex-int.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100215124046.GB18821@bicker> <4B7A6CD9.10903@ladisch.de>
In-Reply-To: <4B7A6CD9.10903@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>

On Tue, 16 Feb 2010, Clemens Ladisch wrote:

> This looks correct; the channels parameter is an interval, not a mask.
>
> 	if (!params->fifo_size) {
> 		if (snd_mask_min(&params->masks[SNDRV_PCM_HW_PARAM_FORMAT]) =
> 		    snd_mask_max(&params->masks[SNDRV_PCM_HW_PARAM_FORMAT]) &&
> 		    snd_mask_min(&params->masks[SNDRV_PCM_HW_PARAM_CHANNELS]) =
> 		    snd_mask_max(&params->masks[SNDRV_PCM_HW_PARAM_CHANNELS])) {
>
> Jaroslav, I guess this should have been snd_interval_min/max?
> And shouldn't the parameters be accessed with hw_param_mask/interval?

Yes, the checks are not valid. Thanks for this notice. I fixed this issue 
in this commit:

http://git.alsa-project.org/?p=alsa-kernel.git;a=commitdiff;h;e522a9514f58e0596db34898a514df206cadc5

 					Jaroslav

-----
Jaroslav Kysela <perex@perex.cz>
Linux Kernel Sound Maintainer
ALSA Project, Red Hat, Inc.

