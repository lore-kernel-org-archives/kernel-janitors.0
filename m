From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 20 Jun 2011 17:49:16 +0000
Subject: Re: [patch] ASoC: adau1701: signedness bug in adau1701_write()
Message-Id: <20110620174916.GA32291@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110620071125.GG14591@shale.localdomain>
In-Reply-To: <20110620071125.GG14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "open list:SOUND - SOC LAYER..." <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>

On Mon, Jun 20, 2011 at 10:11:25AM +0300, Dan Carpenter wrote:
> "ret" is supposed to be signed here.  The current code will only
> return -EIO on error, instead of a more appropriate error code such
> as -EAGAIN etc.

That changelog is not accurate, if nothing else the code will return
-EINVAL if it can't figure out a length for a register.  However, the
change itself is good so applied, thanks.
