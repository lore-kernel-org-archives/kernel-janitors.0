From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 08 Mar 2011 18:57:26 +0000
Subject: Re: [patch] ASoC: sgtl5000: use after free in
Message-Id: <20110308185726.GD21538@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110308113924.GC3416@bicker>
In-Reply-To: <20110308113924.GC3416@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Zeng Zhaoming <b32542@freescale.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Tue, Mar 08, 2011 at 02:39:24PM +0300, Dan Carpenter wrote:
> The "ldo" variable was dereferenced after free on the error path.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Applied, thanks.
