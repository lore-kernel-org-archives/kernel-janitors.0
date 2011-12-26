From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 26 Dec 2011 12:08:55 +0000
Subject: Re: [PATCH 1/9] drivers/mfd/88pm860x-i2c.c: introduce missing kfree
Message-Id: <20111226120855.GB17760@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk>
In-Reply-To: <1324661974-17281-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 23, 2011 at 06:39:26PM +0100, Julia Lawall wrote:
> Error handling code following a kzalloc should free the allocated data.  At
> this point, chip has been allocated and some fields have been initialized,
> but it has not been stored anywhere, so it should be freed before leaving
> the function.

With this and probably a bunch of the other corrections in this series a
conversion to devm_kazlloc() would be a more complete fix as it prevents
people introducing similar missing cleanup paths in future.  Not sure if
spatch can generate that automatically though...
