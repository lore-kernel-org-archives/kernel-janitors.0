From: David Miller <davem@davemloft.net>
Date: Tue, 03 Oct 2017 17:27:14 +0000
Subject: Re: [PATCH 2/2 net-next] mlxsw: spectrum: Add missing error code on allocation failure
Message-Id: <20171003.102714.153187853698749528.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003105303.u7yrzxknddmmerol@mwanda>
        <20171003105340.llwk5oajgrohbksu@mwanda>
In-Reply-To: <20171003105340.llwk5oajgrohbksu@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, yotamg@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 3 Oct 2017 13:53:41 +0300

> We accidentally return success if the kmalloc_array() call fails.
> 
> Fixes: 0e14c7777acb ("mlxsw: spectrum: Add the multicast routing hardware logic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
