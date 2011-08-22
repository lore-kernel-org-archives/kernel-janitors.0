From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 22 Aug 2011 22:29:53 +0000
Subject: Re: [PATCH 2/4] sound/soc/ep93xx/ep93xx-i2s.c: add missing kfree
Message-Id: <20110822222953.GC30609@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313820761-12042-2-git-send-email-julia@diku.dk>
In-Reply-To: <1313820761-12042-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Ryan Mallon <rmallon@gmail.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin <subaparts@yandex.ru>, Liam Girdwood <lrg@ti.com>

On Sat, Aug 20, 2011 at 08:12:39AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Introduce a new label that includes kfree and jump to that one.

Applied, thanks.
