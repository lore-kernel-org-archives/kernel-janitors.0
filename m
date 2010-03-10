From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Wed, 10 Mar 2010 08:04:25 +0000
Subject: Re: [patch] regulator: handle kcalloc() failure
Message-Id: <1268208265.3760.0.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100307123645.GB6469@bicker>
In-Reply-To: <20100307123645.GB6469@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Julia Lawall <julia@diku.dk>, Dmitry Torokhov <dtor@mail.ru>, Wolfram Sang <w.sang@pengutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2010-03-07 at 15:36 +0300, Dan Carpenter wrote:
> Return -ENOMEM if kcalloc() fails
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Applied.

Thanks

Liam

-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

