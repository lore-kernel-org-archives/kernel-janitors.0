From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jul 2015 08:25:19 +0000
Subject: Re: [patch -next] lwtunnel: use kfree_skb() instead of vanilla kfree()
Message-Id: <20150727.012519.1095992977174899951.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150727080747.GA2937@mwanda>
In-Reply-To: <20150727080747.GA2937@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: roopa@cumulusnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2015 11:07:47 +0300

> kfree_skb() is correct here.
> 
> Fixes: ffce41962ef6 ('lwtunnel: support dst output redirect function')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops, good catch.  Applied, thanks Dan.
