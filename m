From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Thu, 13 Sep 2012 04:30:30 +0000
Subject: Re: [PATCH 8/9] sound/soc/soc-core.c: Remove useless kfree
Message-Id: <20120913043028.GD6732@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347462407-13499-8-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347462407-13499-8-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>

On Wed, Sep 12, 2012 at 05:06:46PM +0200, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Remove useless kfree() and clean up code related to the removal.
> 
> The semantic patch that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Applied, thanks.
