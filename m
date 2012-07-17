From: David Miller <davem@davemloft.net>
Date: Tue, 17 Jul 2012 05:58:48 +0000
Subject: Re: [patch] net/mlx4: off by one in parse_trans_rule()
Message-Id: <20120716.225848.2202032682404200150.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063336.GC11812@elgon.mountain>
In-Reply-To: <20120711063336.GC11812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: hadarh@mellanox.co.il, ogerlitz@mellanox.com, eugenia@mellanox.co.il, yevgenyp@mellanox.co.il, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 09:33:36 +0300

> This should be ">=" here instead of ">".  MLX4_NET_TRANS_RULE_NUM is 6.
> We use "spec->id" as an array offset into the __rule_hw_sz[] and
> __sw_id_hw[] arrays which have 6 elements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Dan, in the future please indicate clearly that your patches are
targetted at net-next specifically.  Thanks.
