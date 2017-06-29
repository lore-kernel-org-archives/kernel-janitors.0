From: David Miller <davem@davemloft.net>
Date: Thu, 29 Jun 2017 18:19:47 +0000
Subject: Re: [PATCH net] rocker: move dereference before free
Message-Id: <20170629.141947.1907909639870266602.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170628114421.qyv6lmugpbjqntpt@mwanda>
In-Reply-To: <20170628114421.qyv6lmugpbjqntpt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@resnulli.us, arnd@arndb.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 14:44:21 +0300

> My static checker complains that ofdpa_neigh_del() can sometimes free
> "found".   It just makes sense to use it first before deleting it.
> 
> Fixes: ecf244f753e0 ("rocker: fix maybe-uninitialized warning")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

> Most ref counting function use atomic_dec() but ofdpa_neigh_del() just
> uses normal decrement.  Are you sure this isn't racy?

A spinlock is held always when this counter is touched.
