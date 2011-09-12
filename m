From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 12 Sep 2011 10:49:51 +0000
Subject: Re: [PATCH] sound/soc/kirkwood/kirkwood-i2s.c: fix trivial build
Message-Id: <20110912104951.GC2953@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313820761-12042-1-git-send-email-julia@diku.dk>
	<3099701.CcMbBAJgz4@wuerfel>
In-Reply-To: <3099701.CcMbBAJgz4@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, Liam Girdwood <lrg@ti.com>, Arnaud Patard <arnaud.patard@rtp-net.org>

On Sun, Sep 11, 2011 at 08:07:30PM +0200, Arnd Bergmann wrote:
> A fix merged in 3.1-rc2 introduced a small regression, this should get it
> to build again.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks.

Please try to make sure that your commit logs match the style of the
subsystem.
