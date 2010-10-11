From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Date: Mon, 11 Oct 2010 11:16:03 +0000
Subject: Re: [patch] ASoC: checking kzalloc() for IS_ERR() instead of NULL
Message-Id: <1286795763.4614.3.camel@dplaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101009193131.GA5851@bicker>
In-Reply-To: <20101009193131.GA5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Ian Lartey <ian@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Sat, 2010-10-09 at 21:31 +0200, Dan Carpenter wrote:
> There is a typo here that got copy and pasted to several probe
> functions.  kzalloc() returns NULL on allocation failures and not an
> ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Thanks for noticing this.

Acked-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>

