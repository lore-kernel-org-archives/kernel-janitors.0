From: David Miller <davem@davemloft.net>
Date: Sun, 01 Jul 2012 00:27:08 +0000
Subject: Re: [patch -next] netfilter: use kfree_skb() not kfree()
Message-Id: <20120630.172708.1209859499944103648.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120630114853.GA22767@elgon.mountain>
In-Reply-To: <20120630114853.GA22767@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, bridge@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, bart.de.schuymer@pandora.be, netfilter-devel@vger.kernel.org, shemminger@vyatta.com, pablo@netfilter.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Jun 2012 14:48:53 +0300

> This was should be a kfree_skb() here to free the sk_buff pointer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

My bad, applied, thanks Dan.
