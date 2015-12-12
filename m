From: David Miller <davem@davemloft.net>
Date: Sat, 12 Dec 2015 01:15:51 +0000
Subject: Re: [patch -next] mlxsw: spectrum: fix some error handling
Message-Id: <20151211.201551.1725224415474409711.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209103351.GI3173@mwanda>
In-Reply-To: <20151209103351.GI3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 9 Dec 2015 13:33:51 +0300

> The "err = " assignment is missing here.
> 
> Fixes: 0d65fc13042f ('mlxsw: spectrum: Implement LAG port join/leave')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
