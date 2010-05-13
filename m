From: Lennert Buytenhek <buytenh@wantstofly.org>
Date: Thu, 13 May 2010 20:29:37 +0000
Subject: Re: [PATCH 6/20] drivers/net: Use kzalloc
Message-Id: <20100513202937.GA1795@mail.wantstofly.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132200050.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132200050.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 13, 2010 at 10:00:22PM +0200, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Use kzalloc rather than the combination of kmalloc and memset.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,size,flags;
> statement S;
> @@
> 
> -x = kmalloc(size,flags);
> +x = kzalloc(size,flags);
>  if (x = NULL) S
> -memset(x, 0, size);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Lennert Buytenhek <buytenh@wantstofly.org>
