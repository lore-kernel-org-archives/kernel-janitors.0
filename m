From: David Miller <davem@davemloft.net>
Date: Thu, 28 Apr 2016 20:54:54 +0000
Subject: Re: [patch] tipc: remove an unnecessary NULL check
Message-Id: <20160428.165454.1105669734912206052.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160427080528.GA22469@mwanda>
In-Reply-To: <20160427080528.GA22469@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Apr 2016 11:05:28 +0300

> This is never called with a NULL "buf" and anyway, we dereference 's' on
> the lines before so it would Oops before we reach the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
