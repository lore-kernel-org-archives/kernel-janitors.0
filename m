From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 14 Dec 2009 11:38:51 +0000
Subject: Re: [PATCH 9/9] sound/soc/codecs: Correct code taking the size of
Message-Id: <20091214113851.GD21066@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912131242570.24267@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912131242570.24267@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Sun, Dec 13, 2009 at 12:43:15PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> sizeof(codec->reg_cache) is just the size of the pointer.  Elsewhere in the
> file, codec->reg_cache is used with sizeof(wm8900_reg_defaults), so the
> code is changed to do the same here.

Applied, thanks.
