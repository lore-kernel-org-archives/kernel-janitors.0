From: David Miller <davem@davemloft.net>
Date: Fri, 17 Sep 2010 05:39:35 +0000
Subject: Re: [patch] net/llc: storing negative error codes in unsigned short
Message-Id: <20100916.223935.190380307.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100916181155.GB7867@bicker>
In-Reply-To: <20100916181155.GB7867@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: acme@ghostprotocols.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 16 Sep 2010 20:12:55 +0200

> If the alloc_skb() fails then we return 65431 instead of -ENOBUFS
> (-105). 
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
