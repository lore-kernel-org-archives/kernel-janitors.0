From: David Miller <davem@davemloft.net>
Date: Fri, 18 Mar 2016 22:31:14 +0000
Subject: Re: [patch 2/2 net-next] mediatek: unlock on error in mtk_tx_map()
Message-Id: <20160318.183114.2001849673490296789.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315071904.GI13560@mwanda>
In-Reply-To: <20160315071904.GI13560@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: nbd@openwrt.org, blogic@openwrt.org, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 10:19:04 +0300

> There was a missing unlock on the error path.
> 
> Fixes: 656e705243fd ('net-next: mediatek: add support for MT7623 ethernet')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
