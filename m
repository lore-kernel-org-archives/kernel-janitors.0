From: Luciano Coelho <luciano.coelho@nokia.com>
Date: Mon, 17 May 2010 07:59:37 +0000
Subject: Re: [PATCH 12/37] drivers/net/wireless/wl12xx: Use kmemdup
Message-Id: <1274083177.17643.8.camel@chilepepper>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152316220.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152316220.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ext Julia Lawall <julia@diku.dk>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sat, 2010-05-15 at 23:16 +0200, ext Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use kmemdup when some other buffer is immediately copied into the
> allocated region.
> 
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression from,to,size,flag;
> statement S;
> @@
> 
> -  to = \(kmalloc\|kzalloc\)(size,flag);
> +  to = kmemdup(from,size,flag);
>    if (to=NULL || ...) S
> -  memcpy(to, from, size);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Thanks.

Acked-by: Luciano Coelho <luciano.coelho@nokia.com>

-- 
Cheers,
Luca.

