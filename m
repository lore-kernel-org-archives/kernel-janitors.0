From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Mon, 22 Nov 2010 13:46:17 +0000
Subject: Re: [PATCH] ASoC: s3c24xx: test wrong variable
Message-Id: <1290433577.3309.21.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361223-15211-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290361223-15211-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2010-11-21 at 20:40 +0300, Vasiliy Kulikov wrote:
> After clk_get() mclk is checked three times instead of mout_epll
> and sclk_spdif checks.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  Cannot compile this driver, so it is not tested.
> 
Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

