From: Timur Tabi <timur@freescale.com>
Date: Mon, 22 Nov 2010 16:04:37 +0000
Subject: Re: [PATCH v2] ASoC: atmel: test wrong variable
Message-Id: <4CEA9495.8040605@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361216-15166-1-git-send-email-segoon@openwall.com>
	<20101122094353.f76830b5.jhnikula@gmail.com>
	<20101122155913.GA9089@albatros>
In-Reply-To: <20101122155913.GA9089@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam@alsa-project.org, Girdwood <lrg@slimlogic.co.uk>

Vasiliy Kulikov wrote:
> After clk_get() mclk is checked second time instead of pllb check.
> In patch v1 Jarkko Nikula noticed that PTR_ERR() is also has wrong argument.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Why am I'm being cc'd on Atmel driver patches?  I've done no work on these drivers.

-- 
Timur Tabi
Linux kernel developer at Freescale

