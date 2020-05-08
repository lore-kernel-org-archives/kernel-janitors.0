From: David Miller <davem@davemloft.net>
Date: Fri, 08 May 2020 00:36:42 +0000
Subject: Re: [PATCH net-next] enetc: Fix use after free in stream_filter_unref()
Message-Id: <20200507.173642.1807000659009589804.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200505204721.GA51853@mwanda>
In-Reply-To: <20200505204721.GA51853@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: claudiu.manoil@nxp.com, Po.Liu@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 5 May 2020 23:47:21 +0300

> This code frees "sfi" and then dereferences it on the next line.
> 
> Fixes: 888ae5a3952b ("net: enetc: add tc flower psfp offload driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This was fixed in another patch by using the local variable 'index'.
