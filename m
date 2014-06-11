From: David Miller <davem@davemloft.net>
Date: Wed, 11 Jun 2014 22:40:47 +0000
Subject: Re: [patch] amd-xgbe: unwind on error in xgbe_mdio_register()
Message-Id: <20140611.154047.1548691621132222113.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611065626.GC16443@mwanda>
In-Reply-To: <20140611065626.GC16443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: thomas.lendacky@amd.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 09:56:26 +0300

> There is a typo here so we return directly instead of unwinding.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
