From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 09 Jan 2019 09:32:45 +0000
Subject: Re: [PATCH -next] ALSA: usb-audio: Remove set but not used variable 'first_ch_bits'
Message-Id: <s5hzhsagoqq.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547000416-144563-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1547000416-144563-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: JorgeSanjuan <jorge.sanjuan@codethink.co.uk>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Andrew Chant <achant@google.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 09 Jan 2019 03:20:16 +0100,
YueHaibing wrote:
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> sound/usb/mixer.c: In function 'parse_audio_feature_unit':
> sound/usb/mixer.c:1838:28: warning:
>  variable 'first_ch_bits' set but not used [-Wunused-but-set-variable]
> 
> It never used since 2.6
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks, applied now.


Takashi
