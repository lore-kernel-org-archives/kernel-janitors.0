From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 22 Aug 2011 22:30:16 +0000
Subject: Re: [PATCH 2/2] sound/soc/fsl/mpc8610_hpcd.c: add missing of_node_put
Message-Id: <20110822223016.GE30609@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313823721-16930-2-git-send-email-julia@diku.dk>
In-Reply-To: <1313823721-16930-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lrg@ti.com>, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@freescale.com>

On Sat, Aug 20, 2011 at 09:02:01AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The first change is to add an of_node_put, since codec_np has previously
> been allocated.  The rest of the patch reorganizes the error handling code
> so the only code executed is that which is needed.

Applied, thanks.
