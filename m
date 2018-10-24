From: David Miller <davem@davemloft.net>
Date: Wed, 24 Oct 2018 21:25:58 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Copy the right amount of memory
Message-Id: <20181024.142558.1699802085109283198.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181024083221.humvwh2pefovptcd@kili.mountain>
In-Reply-To: <20181024083221.humvwh2pefovptcd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Oct 2018 11:32:21 +0300

> This is a copy and paste bug where we copied the sizeof() from the chunk
> before.  We're copying more data than intended but the destination is a
> union so it doesn't cause memory corruption.
> 
> Fixes: ffb0abd7e9cb ("octeontx2-af: NIX AQ instruction enqueue support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
