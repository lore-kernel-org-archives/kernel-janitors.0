From: David Miller <davem@davemloft.net>
Date: Sun, 05 May 2019 17:29:51 +0000
Subject: Re: [PATCH 2/2 net-next] net: ll_temac: remove an unnecessary condition
Message-Id: <20190505.102951.1109077189450790567.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503125024.GF29695@mwanda>
        <20190503125051.GG29695@mwanda>
In-Reply-To: <20190503125051.GG29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: esben@geanix.com, michal.simek@xilinx.com, andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 3 May 2019 15:50:51 +0300

> The "pdata->mdio_bus_id" is unsigned so this condition is always true.
> This patch just removes it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
