From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 30 May 2017 16:05:37 +0000
Subject: Re: [PATCH][V2] sound/core/pcm_timer.c: include pcm_local.h and remove some extraneous tabs
Message-Id: <s5h7f0y2uum.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170530103945.32538-1-colin.king@canonical.com>
In-Reply-To: <20170530103945.32538-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 30 May 2017 12:39:45 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> We need to include pcm_local.h to clean up some smatch warnings:
> 
> symbol 'snd_pcm_timer_done' was not declared. Should it be static?
> symbol 'snd_pcm_timer_init' was not declared. Should it be static?
> symbol 'snd_pcm_timer_resolution_change' was not declared. Should
>   it be static?
> 
> Also remove some extraneous tabs on empty lines and replace space
> intentation with a tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
