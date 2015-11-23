From: David Miller <davem@davemloft.net>
Date: Mon, 23 Nov 2015 19:56:36 +0000
Subject: Re: [patch] net/hsr: fix a warning message
Message-Id: <20151123.145636.1037248055461936030.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151121103412.GF7002@mwanda>
In-Reply-To: <20151121103412.GF7002@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: arvid.brodin@alten.se, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Nov 2015 13:34:12 +0300

> WARN_ON_ONCE() takes a condition, it doesn't take an error message.  I
> have converted this to WARN() instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
