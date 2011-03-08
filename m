From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Tue, 08 Mar 2011 18:00:14 +0000
Subject: Re: [alsa-devel] [patch] ASoC: sgtl5000: use after free in
Message-Id: <1299607214.3374.11.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110308113924.GC3416@bicker>
In-Reply-To: <20110308113924.GC3416@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Zeng Zhaoming <b32542@freescale.com>

On Tue, 2011-03-08 at 14:39 +0300, Dan Carpenter wrote:
> The "ldo" variable was dereferenced after free on the error path.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Liam Girdwood <lrg@ti.com>

