From: David Miller <davem@davemloft.net>
Date: Tue, 17 Jan 2012 20:52:31 +0000
Subject: Re: [patch] inetpeer: initialize ->redirect_genid in inet_getpeer()
Message-Id: <20120117.155231.1181293038505383400.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120117204843.GA20999@elgon.mountain>
In-Reply-To: <20120117204843.GA20999@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: eric.dumazet@gmail.com, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2012 23:48:43 +0300

> kmemcheck complains that ->redirect_genid doesn't get initialized.
> Presumably it should be set to zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

It's a "don't care" until we actually get a redirect, but I've applied
your patch nonetheless.

Thanks.
