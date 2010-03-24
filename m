From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 24 Mar 2010 14:04:45 +0000
Subject: Re: [patch] wm8994: playback => capture
Message-Id: <20100324140445.GD26453@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100324115834.GG21571@bicker>
In-Reply-To: <20100324115834.GG21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Joonyoung Shim <jy0922.shim@samsung.com>, alsa-

On Wed, Mar 24, 2010 at 02:58:34PM +0300, Dan Carpenter wrote:
> Sparse caught that initialize "playback" two times instead of
> initializing "capture".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
