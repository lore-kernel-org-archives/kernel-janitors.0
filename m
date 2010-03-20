From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 20 Mar 2010 17:22:41 +0000
Subject: Re: [PATCH 13/24] mfd: fix dangling pointers
Message-Id: <20100320172241.GD1549@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de> <1269094385-16114-14-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-14-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>

On Sat, Mar 20, 2010 at 03:12:54PM +0100, Wolfram Sang wrote:
> Fix I2C-drivers which missed setting clientdata to NULL before freeing the
> structure it points to. Also fix drivers which do this _after_ the structure
> was freed already.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

but it really does seem like this is something that the I2C core ought
to handle - the assignment to null is boiler plate code that's getting
added to the overwhelming majority of I2C devices in their teardown
path, it'd seem a lot more sensible for the core to just trash driver
data after the driver is unbound if it's important that this happens.
