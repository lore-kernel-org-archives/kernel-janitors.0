From: David Miller <davem@davemloft.net>
Date: Wed, 08 Nov 2017 04:35:16 +0000
Subject: Re: [PATCH net-next] bnxt: delete some unreachable code
Message-Id: <20171108.133516.1399823842034296846.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106114301.fjhcskixaji7hh7i@mwanda>
In-Reply-To: <20171106114301.fjhcskixaji7hh7i@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: michael.chan@broadcom.com, jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 6 Nov 2017 14:43:01 +0300

> We return on the previous line so this "return 0;" statement should just
> be deleted.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
