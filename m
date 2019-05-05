From: David Miller <davem@davemloft.net>
Date: Sun, 05 May 2019 17:29:46 +0000
Subject: Re: [PATCH 1/2 net-next] net: ll_temac: Fix an NULL vs IS_ERR() check in temac_open()
Message-Id: <20190505.102946.1600019216217248155.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503125024.GF29695@mwanda>
In-Reply-To: <20190503125024.GF29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: esben@geanix.com, michal.simek@xilinx.com, andrew@lunn.ch, yang.wei9@zte.com.cn, yuehaibing@huawei.com, mcgrof@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 3 May 2019 15:50:24 +0300

> The phy_connect() function doesn't return NULL pointers.  It returns
> error pointers on error, so I have updated the check.
> 
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
