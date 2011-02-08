From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 08 Feb 2011 11:32:57 +0000
Subject: Re: [patch] ALSA: soc-cache: dereferencing before checking
Message-Id: <20110208113256.GC29850@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207190141.GJ4384@bicker>
In-Reply-To: <20110207190141.GJ4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, Feb 07, 2011 at 10:01:41PM +0300, Dan Carpenter wrote:
> The patch c358e640a66 "ASoC: soc-cache: Add trace event for
> snd_soc_cache_sync()" introduced a dereference of "codec->cache_ops"
> before we had checked it for NULL.

Applied, thanks.  Please try to use subject lines for your patches which
are consistent with the subsystem you're submitting to.
