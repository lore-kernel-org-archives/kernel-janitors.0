From: Jeff Garzik <jgarzik@pobox.com>
Date: Wed, 30 Jul 2008 21:23:50 +0000
Subject: Re: [PATCH 2/7] drivers/net/ehea/ehea_main.c: Release mutex in error
Message-Id: <4890DBE6.4080408@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807210957060.24625@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807210957060.24625@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: raisch@de.ibm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The mutex is released on a successful return, so it would seem that it
> should be released on an error return as well.
> 
> The semantic patch finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression l;
> @@
> 
> mutex_lock(l);
> ... when != mutex_unlock(l)
>     when any
>     when strict
> (
> if (...) { ... when != mutex_unlock(l)
> +   mutex_unlock(l);
>     return ...;
> }
> |
> mutex_unlock(l);
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

applied


