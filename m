From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 04 Aug 2012 14:32:04 +0000
Subject: Re: [PATCH 3/3] sound/soc/soc-core.c: drop kfree of devm_kzalloc's data
Message-Id: <20120804143200.GD15691@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344081632-4729-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344081632-4729-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, matthias@kaehlcke.net, Liam Girdwood <lrg@ti.com>

On Sat, Aug 04, 2012 at 02:00:32PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Using kfree to free data allocated with devm_kzalloc causes double frees.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)

Might it make more sense to devm_kfree() them?  If we don't expect to
immediately abort driver instantiation it'll save having them lying
around for the entire lifetime of the device even if they're not
strictly leaked.
