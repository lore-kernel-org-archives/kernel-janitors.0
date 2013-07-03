From: David Miller <davem@davemloft.net>
Date: Wed, 03 Jul 2013 23:52:47 +0000
Subject: Re: [patch -next] net/mlx4: fix small memory leak on error
Message-Id: <20130703.165247.254595318979763597.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130703093746.GE1598@elgon.mountain>
In-Reply-To: <20130703093746.GE1598@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ogerlitz@mellanox.com, roland@purestorage.com, jackm@dev.mellanox.co.il, ronye@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 3 Jul 2013 12:37:46 +0300

> "work" needs to be freed before returning on this error path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
