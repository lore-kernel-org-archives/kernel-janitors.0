From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 18 Mar 2019 12:50:56 +0000
Subject: Re: [PATCH] ALSA: opl3: fix mismatch between snd_opl3_drum_switch definition and declaration
Message-Id: <s5ho968firz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190317232124.7740-1-colin.king@canonical.com>
In-Reply-To: <20190317232124.7740-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 18 Mar 2019 00:21:24 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function snd_opl3_drum_switch declaration in the header file
> has the order of the two arguments on_off and vel swapped when
> compared to the definition arguments of vel and on_off.  Fix this
> by swapping them around to match the definition.
> 
> This error predates the git history, so no idea when this error
> was introduced.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
