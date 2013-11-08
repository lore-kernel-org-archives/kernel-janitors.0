From: David Miller <davem@davemloft.net>
Date: Fri, 08 Nov 2013 00:13:57 +0000
Subject: Re: [patch] net: make ndev->irq signed for error handling
Message-Id: <20131107.191357.715504104393441553.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107074849.GF21844@elgon.mountain>
In-Reply-To: <20131107074849.GF21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 7 Nov 2013 10:48:49 +0300

> There is a bug in cpsw_probe() where we do:
> 
> 	ndev->irq = platform_get_irq(pdev, 0);
> 	if (ndev->irq < 0) {
> 
> The problem is that "ndev->irq" is unsigned so the error handling
> doesn't work.  I have changed it to a regular int.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Even though some simplifications have been suggested wrt. how
this irq value is obtained in the one place where it is used,
I am applying Dan's patch for now.
