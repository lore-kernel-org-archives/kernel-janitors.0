From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 01 Jun 2011 18:21:14 +0000
Subject: Re: [PATCH 2/10] sound/soc/nuc900/nuc900-ac97.c: add missing clk_put
Message-Id: <20110601182114.GC16396@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1306948213-20767-2-git-send-email-julia@diku.dk>
In-Reply-To: <1306948213-20767-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Timur Tabi <timur@freescale.com>, Wan ZongShun <mcuos.com@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Axel Lin <axel.lin@gmail.com>, Liam Girdwood <lrg@ti.com>

On Wed, Jun 01, 2011 at 07:10:05PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> This goto is after the call to clk_get, so it should go to the label that
> includes a call to clk_put.

Applied, thanks.  Please do try to use subject lines for your patches
consistent with the code you're submitting against.
