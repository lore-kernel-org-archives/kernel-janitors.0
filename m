From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Oct 2017 11:36:12 +0000
Subject: Re: [PATCH] ALSA: pcm: remove redundant variable runtime
Message-Id: <s5hpo9n1g0j.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171015210644.15565-1-colin.king@canonical.com>
In-Reply-To: <20171015210644.15565-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 15 Oct 2017 23:06:44 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit removed the access to variable runtime
> and we are now left with unused variable that is redundant,
> so remove it.
> 
> Cleans up the clang warning: Value stored to 'runtime' is never read
> 
> Fixes: e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO internal command")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
