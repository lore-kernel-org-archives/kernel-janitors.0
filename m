From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 10 Dec 2012 05:23:36 +0000
Subject: Re: [PATCH 3/3] sound/soc/soc-core.c: drop kfree of devm_kzalloc's data
Message-Id: <20121210052334.GI10927@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354989680-25794-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1354989680-25794-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Liam Girdwood <lrg@ti.com>, matthias@kaehlcke.net, kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Sat, Dec 08, 2012 at 07:01:20PM +0100, Julia Lawall wrote:

> The kfrees were introduced in b761c0ca.
> I sent this a few months ago, and I still think it should be applied...

I'm missing patches 1 and 2?
