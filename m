From: David Miller <davem@davemloft.net>
Date: Mon, 26 Jan 2015 07:33:16 +0000
Subject: Re: [patch] bridge: simplify br_getlink() a bit
Message-Id: <20150125.233316.1272794874104313977.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150121092235.GA19206@mwanda>
In-Reply-To: <20150121092235.GA19206@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: stephen@networkplumber.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Jan 2015 12:22:35 +0300

> Static checkers complain that we should maybe set "ret" before we do the
> "goto out;".  They interpret the NULL return from br_port_get_rtnl() as
> a failure and forgetting to set the error code is a common bug in this
> situation.
> 
> The code is confusing but it's actually correct.  We are returning zero
> deliberately.  Let's re-write it a bit to be more clear.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
