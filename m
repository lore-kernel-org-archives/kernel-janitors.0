From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sun, 07 Mar 2010 17:51:44 +0000
Subject: Re: [patch] regulator: handle kcalloc() failure
Message-Id: <20100307175144.GB27785@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100307123645.GB6469@bicker>
In-Reply-To: <20100307123645.GB6469@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, Julia Lawall <julia@diku.dk>, Dmitry Torokhov <dtor@mail.ru>, Wolfram Sang <w.sang@pengutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Mar 07, 2010 at 03:36:45PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if kcalloc() fails
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
