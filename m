From: David Miller <davem@davemloft.net>
Date: Fri, 17 Feb 2017 17:19:05 +0000
Subject: Re: [patch] dpaa_eth: small leak on error
Message-Id: <20170217.121905.367129884701818238.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216095610.GA23242@mwanda>
In-Reply-To: <20170216095610.GA23242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Feb 2017 12:56:10 +0300

> This should be >= instead of > here.  It means that we don't increment
> the free count enough so it becomes off by one.
> 
> Fixes: 9ad1a3749333 ("dpaa_eth: add support for DPAA Ethernet")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Applies to -net tree.

Applied, thanks Dan.
