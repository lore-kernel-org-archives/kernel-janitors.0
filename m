From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 10 Dec 2012 07:18:31 +0000
Subject: Re: [PATCH 3/3] sound/soc/soc-core.c: drop kfree of devm_kzalloc's data
Message-Id: <20121210071829.GL10927@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354989680-25794-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1354989680-25794-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Liam Girdwood <lrg@ti.com>, matthias@kaehlcke.net, kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Sat, Dec 08, 2012 at 07:01:20PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Using kfree to free data allocated with devm_kzalloc causes double frees.

Ugh, actually this doesn't merge down very well against -next at all,
can you regenerate against current code please?
