From: David Miller <davem@davemloft.net>
Date: Thu, 09 Jan 2020 00:03:59 +0000
Subject: Re: [PATCH net-next] ethtool: fix ->reply_size() error handling
Message-Id: <20200108.160359.356749095676572714.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108054125.feeckqg6xhab3wam@kili.mountain>
In-Reply-To: <20200108054125.feeckqg6xhab3wam@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: mkubecek@suse.cz, f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 8 Jan 2020 08:41:25 +0300

> The "ret < 0" comparison is never true because "ret" is still zero.
> 
> Fixes: 728480f12442 ("ethtool: default handlers for GET requests")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
