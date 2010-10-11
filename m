From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 11 Oct 2010 11:38:49 +0000
Subject: Re: [patch] ASoC: checking kzalloc() for IS_ERR() instead of NULL
Message-Id: <20101011113848.GI9231@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101009193131.GA5851@bicker>
In-Reply-To: <20101009193131.GA5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Ian Lartey <ian@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Sat, Oct 09, 2010 at 09:31:31PM +0200, Dan Carpenter wrote:
> There is a typo here that got copy and pasted to several probe
> functions.  kzalloc() returns NULL on allocation failures and not an
> ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
