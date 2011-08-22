From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 22 Aug 2011 22:30:31 +0000
Subject: Re: [PATCH] [v2] sound/soc/fsl/fsl_dma.c: add missing of_node_put
Message-Id: <20110822223031.GF30609@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314022961-27513-1-git-send-email-timur@freescale.com>
In-Reply-To: <1314022961-27513-1-git-send-email-timur@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, julia@diku.dk, linuxppc-dev@lists.ozlabs.org, lrg@ti.com

On Mon, Aug 22, 2011 at 09:22:41AM -0500, Timur Tabi wrote:
> of_parse_phandle increments the reference count of np, so this should be
> decremented before trying the next possibility.
> 
> Since we don't actually use np, we can decrement the reference count
> immediately.

Applied, thanks.
