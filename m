From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Mon, 22 Mar 2010 19:49:10 +0000
Subject: Re: [PATCH 17/24] regulator: fix dangling pointers
Message-Id: <1269287350.3754.22.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
	 <1269094385-16114-18-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-18-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Sat, 2010-03-20 at 15:12 +0100, Wolfram Sang wrote:
> Fix I2C-drivers which missed setting clientdata to NULL before freeing the
> structure it points to. Also fix drivers which do this _after_ the structure
> was freed already.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Liam Girdwood <lrg@slimlogic.co.uk>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> 

Applied.

Thanks

Liam

-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

