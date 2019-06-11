From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 11 Jun 2019 09:35:26 +0000
Subject: Re: [PATCH -next] ALSA: lx6464es - Remove set but not used variables 'orun_mask, urun_mask'
Message-Id: <s5hd0jkbh29.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190601041214.99366-1-yuehaibing@huawei.com>
In-Reply-To: <20190601041214.99366-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, KateStewart <kstewart@linuxfoundation.org>, AllisonRandal <allison@lohutok.net>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 01 Jun 2019 06:12:14 +0200,
YueHaibing wrote:
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> sound/pci/lx6464es/lx_core.c: In function 'lx_interrupt_handle_async_events':
> sound/pci/lx6464es/lx_core.c:990:6: warning:
>  variable 'urun_mask' set but not used [-Wunused-but-set-variable]
> sound/pci/lx6464es/lx_core.c:989:6: warning:
>  variable 'orun_mask' set but not used [-Wunused-but-set-variable]
> 
> They are never used, so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.


Takashi
