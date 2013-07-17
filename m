From: Stephen Warren <swarren@wwwdotorg.org>
Date: Wed, 17 Jul 2013 15:03:53 +0000
Subject: Re: [patch] spi/xilinx: signedness issue checking platform_get_irq()
Message-Id: <51E6B259.3030303@wwwdotorg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130717122638.GB4851@elgon.mountain>
In-Reply-To: <20130717122638.GB4851@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org

On 07/17/2013 06:26 AM, Dan Carpenter wrote:
> "xspi->irq" is unsigned int so it's never less than zero.  I have added
> a cast.

Um. Doesn't this just hide a warning, not solve the problem? If the
value can't be negative, so the if condition never fires, then the cast
won't change that...
