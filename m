From: David Miller <davem@davemloft.net>
Date: Wed, 13 Aug 2008 09:41:00 +0000
Subject: Re: [PATCH] net/rxrpc: Use an IS_ERR test rather than a NULL test
Message-Id: <20080813.024100.169404612.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200808081355.21787.brunel@diku.dk>
In-Reply-To: <200808081355.21787.brunel@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brunel@diku.dk
Cc: kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>
Date: Fri, 8 Aug 2008 13:55:21 +0200

> In case of error, the function rxrpc_get_transport returns an ERR
> pointer, but never returns a NULL pointer. So after a call to this
> function, a NULL test should be replaced by an IS_ERR test.
> 
> A simplified version of the semantic patch that makes this change is
> as follows: 
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by:  Julien Brunel <brunel@diku.dk>
> Signed-off-by:  Julia Lawall <julia@diku.dk>

Applied, thank you.
