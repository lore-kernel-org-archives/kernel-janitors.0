From: David Miller <davem@davemloft.net>
Date: Tue, 01 Apr 2014 20:27:39 +0000
Subject: Re: [patch 2/3] net: sxgbe: fix logical vs bitwise operation
Message-Id: <20140401.162739.945883984370804455.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140401133900.GB11536@mwanda>
In-Reply-To: <20140401133900.GB11536@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: bh74.an@samsung.com, ks.giri@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 1 Apr 2014 16:39:00 +0300

> Bitwise '|' was intended here instead of logical '||'.
> 
> Fixes: 1edb9ca69e8a ('net: sxgbe: add basic framework for Samsung 10Gb ethernet driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
