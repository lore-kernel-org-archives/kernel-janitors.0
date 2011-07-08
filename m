From: David Miller <davem@davemloft.net>
Date: Fri, 08 Jul 2011 16:02:40 +0000
Subject: Re: [patch] dcbnl: unlock on an error path in dcbnl_cee_fill()
Message-Id: <20110708.090240.1560541664509139277.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110708072724.GW18655@shale.localdomain>
In-Reply-To: <20110708072724.GW18655@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: shmulikr@broadcom.com, john.r.fastabend@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 8 Jul 2011 10:27:24 +0300

> We need to release "dcb_lock" which we took on the previous line.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks!
