From: David Miller <davem@davemloft.net>
Date: Thu, 14 May 2015 04:49:24 +0000
Subject: Re: [patch -next] net: macb: OR vs AND typos
Message-Id: <20150514.004924.1739796884775337118.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150512181524.GE5672@mwanda>
In-Reply-To: <20150512181524.GE5672@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: nicolas.ferre@atmel.com, harini.katakam@xilinx.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 May 2015 21:15:24 +0300

> The bitwise tests are always true here because it uses '|' where '&' is
> intended.
> 
> Fixes: 98b5a0f4a228 ('net: macb: Add support for jumbo frames')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
