From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 22 Nov 2010 14:00:02 +0000
Subject: Re: [PATCH] ASoC: s3c24xx: test wrong variable
Message-Id: <20101122140002.GB18960@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361223-15211-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290361223-15211-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Sun, Nov 21, 2010 at 08:40:21PM +0300, Vasiliy Kulikov wrote:
> After clk_get() mclk is checked three times instead of mout_epll
> and sclk_spdif checks.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Applied, thanks.
