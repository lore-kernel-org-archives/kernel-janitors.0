From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 22 Aug 2011 22:29:45 +0000
Subject: Re: [PATCH 1/4] sound/soc/kirkwood/kirkwood-i2s.c: add missing kfree
Message-Id: <20110822222944.GB30609@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313820761-12042-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313820761-12042-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Arnaud Patard <arnaud.patard@rtp-net.org>

On Sat, Aug 20, 2011 at 08:12:38AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Adjust the goto to jump to the error handling code that includes kfree.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Applied, thanks.
