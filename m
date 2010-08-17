From: Luciano Coelho <luciano.coelho@nokia.com>
Date: Tue, 17 Aug 2010 05:42:21 +0000
Subject: Re: [PATCH 10/16] drivers/net/wireless/wl12xx: Use available error
Message-Id: <1282023741.1773.9.camel@powerslave>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008161827140.19313@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008161827140.19313@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ext Julia Lawall <julia@diku.dk>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, 2010-08-16 at 18:27 +0200, ext Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error codes are stored in ret, but the return value is always 0.  Return
> ret instead.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> local idexpression x;
> constant C;
> @@
> 
> if (...) { ...
>   x = -C
>   ... when != x
> (
>   return <+...x...+>;
> |
>   return NULL;
> |
>   return;
> |
> * return ...;
> )
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---


This was indeed a bug.  Thanks!

Acked-by: Luciano Coelho <luciano.coelho@nokia.com>

-- 
Cheers,
Luca.

