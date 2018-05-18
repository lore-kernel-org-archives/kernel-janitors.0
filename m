From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 18 May 2018 11:39:14 +0000
Subject: Re: [PATCH] ALSA: dice: fix a bounds check in snd_dice_detect_tcelectronic_formats()
Message-Id: <s5hfu2pjiql.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518091607.GA32078@mwanda>
In-Reply-To: <20180518091607.GA32078@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Clemens Ladisch <clemens@ladisch.de>

On Fri, 18 May 2018 11:16:07 +0200,
Dan Carpenter wrote:
> 
> The "entry" pointer is always non-NULL so this test for out of bounds
> won't work.
> 
> Fixes: f1f0f330b1d0 ("ALSA: dice: add parameters of stream formats for models produced by TC Electronic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
