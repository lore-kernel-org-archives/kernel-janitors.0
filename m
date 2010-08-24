From: David Miller <davem@davemloft.net>
Date: Tue, 24 Aug 2010 21:50:47 +0000
Subject: Re: [patch 2/4] pxa168_eth: fix error handling in prope
Message-Id: <20100824.145047.179951528.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824165333.GI29330@bicker>
In-Reply-To: <20100824165333.GI29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: ssanap@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 18:53:33 +0200

> A couple issues here:
> * Some resources weren't released.  
> * If alloc_etherdev() failed it would have caused a NULL dereference
>   because "pep" would be null when we checked "if (pep->clk)".
> * Also it's better to propagate the error codes from mdiobus_register()
>   instead of just returning -ENOMEM.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
