From: David Miller <davem@davemloft.net>
Date: Tue, 05 Oct 2010 07:40:01 +0000
Subject: Re: [patch] cls_u32: signedness bug
Message-Id: <20101005.004001.214209669.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101004122836.GB5692@bicker>
In-Reply-To: <20101004122836.GB5692@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: hadi@cyberus.ca, shemminger@vyatta.com, elendil@planet.nl, xiaosuo@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 4 Oct 2010 14:28:36 +0200

> skb_headroom() is unsigned so "skb_headroom(skb) + toff" is also
> unsigned and can't be less than zero.  This test was added in 66d50d25:
> "u32: negative offset fix"  It was supposed to fix a regression.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  Please check.

This looks correct to me, thanks for fixing this.

Applied.
