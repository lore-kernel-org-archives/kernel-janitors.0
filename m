From: David Miller <davem@davemloft.net>
Date: Sat, 28 Aug 2010 02:32:14 +0000
Subject: Re: [PATCH] net/ipv4: Eliminate kstrdup memory leak
Message-Id: <20100827.193214.71098473.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282938463-26450-1-git-send-email-julia@diku.dk>
In-Reply-To: <1282938463-26450-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: kernel-janitors@vger.kernel.org, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Fri, 27 Aug 2010 21:47:43 +0200

> The string clone is only used as a temporary copy of the argument val
> within the while loop, and so it should be freed before leaving the
> function.  The call to strsep, however, modifies clone, so a pointer to the
> front of the string is kept in saved_clone, to make it possible to free it.
> 
> The sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks!
