From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Mon, 22 Nov 2010 16:05:01 +0000
Subject: Re: [PATCH v2] ASoC: atmel: test wrong variable
Message-Id: <1290441901.3309.68.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361216-15166-1-git-send-email-segoon@openwall.com>
	<20101122094353.f76830b5.jhnikula@gmail.com>
	<20101122155913.GA9089@albatros>
In-Reply-To: <20101122155913.GA9089@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Mark@alsa-project.org, Timur Tabi <timur@freescale.com>

On Mon, 2010-11-22 at 18:59 +0300, Vasiliy Kulikov wrote:
> After clk_get() mclk is checked second time instead of pllb check.
> In patch v1 Jarkko Nikula noticed that PTR_ERR() is also has wrong argument.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

