From: David Miller <davem@davemloft.net>
Date: Tue, 03 Oct 2017 17:27:08 +0000
Subject: Re: [PATCH 1/2 net-next] mlxsw: spectrum: Fix check for IS_ERR() instead of NULL
Message-Id: <20171003.102708.974344064764110062.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003105303.u7yrzxknddmmerol@mwanda>
In-Reply-To: <20171003105303.u7yrzxknddmmerol@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, yotamg@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 3 Oct 2017 13:53:03 +0300

> mlxsw_afa_block_create() doesn't return error pointers, it returns NULL
> on error.
> 
> Fixes: 0e14c7777acb ("mlxsw: spectrum: Add the multicast routing hardware logic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
