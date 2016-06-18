From: David Miller <davem@davemloft.net>
Date: Sat, 18 Jun 2016 04:27:19 +0000
Subject: Re: [patch -next] tipc: potential shift wrapping bug in map_set()
Message-Id: <20160617.212719.1901762351352671976.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617092226.GD25609@mwanda>
In-Reply-To: <20160617092226.GD25609@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jun 2016 12:22:26 +0300

> "up_map" is a u64 type but we're not using the high 32 bits.
> 
> Fixes: 35c55c9877f8 ('tipc: add neighbor monitoring framework')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
