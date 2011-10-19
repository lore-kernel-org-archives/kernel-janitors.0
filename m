From: David Miller <davem@davemloft.net>
Date: Wed, 19 Oct 2011 23:36:05 +0000
Subject: Re: [patch] filter: use unsigned int to silence static checker
Message-Id: <20111019.193605.621716042975197432.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018070420.GR27732@elgon.mountain>
In-Reply-To: <20111018070420.GR27732@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, eric.dumazet@gmail.com, xiaosuo@gmail.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 10:04:20 +0300

> This is just a cleanup.
> 
> My testing version of Smatch warns about this:
> net/core/filter.c +380 check_load_and_stores(6)
> 	warn: check 'flen' for negative values
> 
> flen comes from the user.  We try to clamp the values here between 1
> and BPF_MAXINSNS but the clamp doesn't work because it could be
> negative.  This is a bug, but it's not exploitable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks Dan.
