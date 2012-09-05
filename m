From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 05 Sep 2012 12:37:23 +0000
Subject: Re: [patch] ASoC: wm0010: unlock on error path
Message-Id: <20120905123720.GA10580@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905122946.GA6128@elgon.mountain>
In-Reply-To: <20120905122946.GA6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>

On Wed, Sep 05, 2012 at 03:29:46PM +0300, Dan Carpenter wrote:
> We're holding the wm0010->lock mutex when we goto err_core.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
