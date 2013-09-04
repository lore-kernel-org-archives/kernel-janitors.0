From: David Miller <davem@davemloft.net>
Date: Wed, 04 Sep 2013 02:49:39 +0000
Subject: Re: [patch] sfc: check for allocation failure
Message-Id: <20130903.224939.866623192858217581.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130902082828.GA30037@elgon.mountain>
In-Reply-To: <20130902082828.GA30037@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, bhutchings@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 2 Sep 2013 12:04:42 +0300

> It upsets static analyzers when we don't check for allocation failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This applies cleanly neither to net nor net-next, please send me a
version that does.

Thanks.
