From: David Miller <davem@davemloft.net>
Date: Wed, 01 Mar 2017 17:52:35 +0000
Subject: Re: [patch] net/mlx4: && vs & typo
Message-Id: <20170301.125235.1175480613831613770.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170228120215.GA27947@mwanda>
In-Reply-To: <20170228120215.GA27947@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yishaih@mellanox.com, eugenia@mellanox.com, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Feb 2017 15:02:15 +0300

> Bitwise & was obviously intended here.
> 
> Fixes: 745d8ae4622c ("net/mlx4: Spoofcheck and zero MAC can't coexist")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
