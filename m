From: David Miller <davem@davemloft.net>
Date: Wed, 30 Jun 2010 20:12:13 +0000
Subject: Re: [patch] cpmac: use resource_size()
Message-Id: <20100630.131213.199034040.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100628211933.GL19184@bicker>
In-Reply-To: <20100628211933.GL19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: florian@openwrt.org, jpirko@redhat.com, eric.dumazet@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 28 Jun 2010 23:19:33 +0200

> The original code is off by one because we should start counting at
> zero.  So the size of the resource is end - start + 1.  I switched it to
> use resource_size() to do the calculation.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to net-next-2.6, thanks Dan.
