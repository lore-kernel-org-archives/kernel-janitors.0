From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Jun 2010 07:07:01 +0000
Subject: Re: [patch] input: error handling bug in lm8323_probe()
Message-Id: <20100629070701.GB19712@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100610075431.GK5483@bicker>
In-Reply-To: <20100610075431.GK5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Richard Purdie <rpurdie@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 10, 2010 at 09:54:31AM +0200, Dan Carpenter wrote:
> We reuse the "i" variable later on so if we goto fail3 or fail4 then "i"
> will be set to the wrong thing and cause a crash.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Applied to next, thanks Dan.

-- 
Dmitry
