From: David Miller <davem@davemloft.net>
Date: Thu, 09 Jan 2020 00:03:55 +0000
Subject: Re: [PATCH net-next] ethtool: fix a memory leak in ethnl_default_start()
Message-Id: <20200108.160355.2056120405467352285.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108053947.776s3sp3op6v7a6r@kili.mountain>
In-Reply-To: <20200108053947.776s3sp3op6v7a6r@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: mkubecek@suse.cz, f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 8 Jan 2020 08:39:48 +0300

> If ethnl_default_parse() fails then we need to free a couple
> memory allocations before returning.
> 
> Fixes: 728480f12442 ("ethtool: default handlers for GET requests")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
