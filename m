From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Date: Tue, 08 Feb 2011 10:45:24 +0000
Subject: Re: [alsa-devel] [patch] ALSA: soc-cache: dereferencing before
Message-Id: <1297161924.14540.0.camel@dplaptop.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207190141.GJ4384@bicker>
In-Reply-To: <20110207190141.GJ4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, 2011-02-07 at 22:01 +0300, Dan Carpenter wrote:
> The patch c358e640a66 "ASoC: soc-cache: Add trace event for
> snd_soc_cache_sync()" introduced a dereference of "codec->cache_ops"
> before we had checked it for NULL.
> 
> I pulled the check forward, and then pulled everything in an indent
> level.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Dah, thanks for catching this.

Dimitris

