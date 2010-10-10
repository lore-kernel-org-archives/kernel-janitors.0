From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Sun, 10 Oct 2010 13:36:37 +0000
Subject: Re: [patch] ASoC: checking kzalloc() for IS_ERR() instead of NULL
Message-Id: <1286717797.3429.20.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101009193131.GA5851@bicker>
In-Reply-To: <20101009193131.GA5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Ian Lartey <ian@opensource.wolfsonmicro.com>

On Sat, 2010-10-09 at 21:31 +0200, Dan Carpenter wrote:
> There is a typo here that got copy and pasted to several probe
> functions.  kzalloc() returns NULL on allocation failures and not an
> ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

