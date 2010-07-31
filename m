From: David Miller <davem@davemloft.net>
Date: Sat, 31 Jul 2010 06:29:06 +0000
Subject: Re: [patch] dnet: fixup error handling in initialization
Message-Id: <20100730.232906.48506176.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729082729.GS26313@bicker>
In-Reply-To: <20100729082729.GS26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, shemminger@vyatta.com, eric.dumazet@gmail.com, elendil@planet.nl, richard.cochran@omicron.at, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Jul 2010 10:27:29 +0200

> There were two problems here.  We returned success if dnet_mii_init()
> failed and there was a release_mem_region() missing.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
