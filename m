From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 14 Feb 2019 07:58:32 +0000
Subject: Re: [PATCH -next] ALSA: es1688: Remove set but not used variable 'hw'
Message-Id: <s5hbm3eby3b.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214021033.89964-1-yuehaibing@huawei.com>
In-Reply-To: <20190214021033.89964-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 14 Feb 2019 03:10:33 +0100,
YueHaibing wrote:
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> sound/isa/es1688/es1688_lib.c: In function 'snd_es1688_probe':
> sound/isa/es1688/es1688_lib.c:124:31: warning:
>  variable 'hw' set but not used [-Wunused-but-set-variable]
>   unsigned short major, minor, hw;
>                                ^
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.


Takashi
