From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 12 Sep 2009 12:42:29 +0000
Subject: Re: [PATCH 8/8, retry] sound/soc: introduce missing kfree
Message-Id: <20090912124229.GB4633@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909121424420.8557@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909121424420.8557@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Sat, Sep 12, 2009 at 02:25:35PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kzalloc should free the allocated data.
> Error handling code following an ioremap should iounmap the allocated data.

Applied after manually fixing paths (the patch had a bunch of prefixes
in the directory name).  Thanks!
