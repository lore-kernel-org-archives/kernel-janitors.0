From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 20 Jun 2018 10:44:27 +0000
Subject: Re: [PATCH] rtc: mrst: fix error code in probe()
Message-Id: <20180620104427.GB7737@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180612120302.kprwknomakzg7bdn@kili.mountain>
In-Reply-To: <20180612120302.kprwknomakzg7bdn@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/06/2018 15:03:02+0300, Dan Carpenter wrote:
> We should be returning "retval".  The "mrst_rtc.rtc" variable is a valid
> pointer.
> 
> Fixes: 32b41f93dcaf ("rtc: mrst: switch to devm functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
