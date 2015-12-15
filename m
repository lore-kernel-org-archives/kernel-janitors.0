From: David Miller <davem@davemloft.net>
Date: Tue, 15 Dec 2015 17:51:42 +0000
Subject: Re: [patch -mainline] amd-xgbe: fix a couple timeout loops
Message-Id: <20151215.125142.35117005882837154.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151215101229.GF20848@mwanda>
In-Reply-To: <20151215101229.GF20848@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: thomas.lendacky@amd.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 13:12:29 +0300

> At the end of the loop we test "if (!count)" but because "count--" is
> a post-op then the loop will end with count set to -1.  I have fixed
> this by changing it to --count.
> 
> Fixes: c5aa9e3b8156 ('amd-xgbe: Initial AMD 10GbE platform driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
