From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 07 Jun 2018 18:11:24 +0000
Subject: Re: [PATCH] rtc: pxa: fix probe function
Message-Id: <20180607181124.GC10521@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180607082909.iyukeclgrb3dtjsy@kili.mountain>
In-Reply-To: <20180607082909.iyukeclgrb3dtjsy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/06/2018 11:29:09+0300, Dan Carpenter wrote:
> This patch is from static analysis and I don't have the hardware to
> to test it.  I think the test is reversed so now the probe function
> will return success early and the last part of the function is dead
> code.
> 
> Fixes: 3cdf4ad9633e ("rtc: pxa: convert to use shared sa1100 functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
