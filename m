From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:14:38 +0000
Subject: Re: [PATCH net] net: socionext: Fix a signedness bug in ave_probe()
Message-Id: <20190927.101438.1911842769067545634.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105750.GG3264@mwanda>
In-Reply-To: <20190925105750.GG3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: hayashi.kunihiko@socionext.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:57:50 +0300

> The "phy_mode" variable is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
> 
> Fixes: 4c270b55a5af ("net: ethernet: socionext: add AVE ethernet driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
