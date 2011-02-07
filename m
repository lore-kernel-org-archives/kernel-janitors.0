From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Mon, 07 Feb 2011 19:11:53 +0000
Subject: Re: [alsa-devel] [patch] ALSA: soc-cache: dereferencing before
Message-Id: <1297105913.3331.356.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207190141.GJ4384@bicker>
In-Reply-To: <20110207190141.GJ4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

On Mon, 2011-02-07 at 22:01 +0300, Dan Carpenter wrote:
> The patch c358e640a66 "ASoC: soc-cache: Add trace event for
> snd_soc_cache_sync()" introduced a dereference of "codec->cache_ops"
> before we had checked it for NULL.
> 
> I pulled the check forward, and then pulled everything in an indent
> level.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

