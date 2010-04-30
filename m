From: David Miller <davem@davemloft.net>
Date: Fri, 30 Apr 2010 23:42:52 +0000
Subject: Re: [patch] ipv6: cleanup: remove unneeded null check
Message-Id: <20100430.164252.170100570.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100429143034.GI29093@bicker>
In-Reply-To: <20100429143034.GI29093@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, eric.dumazet@gmail.com, sri@us.ibm.com, herbert@gondor.apana.org.au, emils.tantilov@gmail.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Apr 2010 16:30:35 +0200

> We dereference "sk" unconditionally elsewhere in the function.  
> 
> This was left over from:  b30bd282 "ip6_xmit: remove unnecessary NULL
> ptr check".  According to that commit message, "the sk argument to 
> ip6_xmit is never NULL nowadays since the skb->priority assigment 
> expects a valid socket."
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
