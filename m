From: David Miller <davem@davemloft.net>
Date: Tue, 17 Jul 2012 05:58:53 +0000
Subject: Re: [patch] net/mlx4_en: dereferencing freed memory
Message-Id: <20120716.225853.1031106440346773611.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063407.GD11812@elgon.mountain>
In-Reply-To: <20120711063407.GD11812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yevgenyp@mellanox.co.il, amirv@mellanox.com, ogerlitz@mellanox.com, alexg@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 09:34:07 +0300

> We dereferenced "mclist" after the kfree().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
