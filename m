From: David Miller <davem@davemloft.net>
Date: Mon, 06 Feb 2017 17:01:14 +0000
Subject: Re: [patch net-next] net/mlx4_en: fix a condition
Message-Id: <20170206.120114.1158013558292422641.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203095459.GA5704@mwanda>
In-Reply-To: <20170203095459.GA5704@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yishaih@mellanox.com, shakerd@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 3 Feb 2017 12:54:59 +0300

> There is a "||" vs "|" typo here so we test 0x1 instead of 0x6.
> 
> Fixes: 1f8176f7352a ("net/mlx4_en: Check the enabling pptx/pprx flags in SET_PORT wrapper flow")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
