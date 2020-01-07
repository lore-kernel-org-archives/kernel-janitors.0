From: David Miller <davem@davemloft.net>
Date: Tue, 07 Jan 2020 21:47:11 +0000
Subject: Re: [PATCH net-next] enetc: Fix an off by one in enetc_setup_tc_txtime()
Message-Id: <20200107.134711.1860200595614980441.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107131143.jqytedvewberqp5c@kili.mountain>
In-Reply-To: <20200107131143.jqytedvewberqp5c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: claudiu.manoil@nxp.com, po.liu@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Jan 2020 16:11:43 +0300

> The priv->tx_ring[] has 16 elements but only priv->num_tx_rings are
> set up, the rest are NULL.  This ">" comparison should be ">=" to avoid
> a potential crash.
> 
> Fixes: 0d08c9ec7d6e ("enetc: add support time specific departure base on the qos etf")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
