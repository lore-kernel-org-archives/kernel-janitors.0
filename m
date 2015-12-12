From: David Miller <davem@davemloft.net>
Date: Sat, 12 Dec 2015 01:15:56 +0000
Subject: Re: [patch -next] mlxsw: core: remove an unneeded condition
Message-Id: <20151211.201556.1303183841845667915.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209104129.GJ3173@mwanda>
In-Reply-To: <20151209104129.GJ3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 9 Dec 2015 13:41:29 +0300

> We already know "err" is zero so there is no need to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
