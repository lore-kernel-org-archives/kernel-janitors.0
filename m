From: David Miller <davem@davemloft.net>
Date: Wed, 01 Feb 2017 17:45:38 +0000
Subject: Re: [patch net-next] ethernet: aquantia: fix dma_mapping_error test
Message-Id: <20170201.124538.2087709954972565603.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170201085215.GB31514@mwanda>
In-Reply-To: <20170201085215.GB31514@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: vomlehn@texas.net, Dmitry.Bezrukov@aquantia.com, Pavel.Belous@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 1 Feb 2017 11:52:15 +0300

> dma_mapping_error() returns 1 if there is an error and 0 if not.
> 
> Fixes: 018423e90bee ("net: ethernet: aquantia: Add ring support code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
