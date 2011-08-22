From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 22 Aug 2011 22:30:01 +0000
Subject: Re: [PATCH 1/2] sound/soc/fsl/p1022_ds.c: add missing of_node_put
Message-Id: <20110822223000.GD30609@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313823721-16930-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313823721-16930-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Axel Lin <axel.lin@gmail.com>, Timur Tabi <timur@freescale.com>

On Sat, Aug 20, 2011 at 09:02:00AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> dma_channel_np has been accessed at this point, so decrease its reference
> count before leaving the function.

Applied, thanks.
