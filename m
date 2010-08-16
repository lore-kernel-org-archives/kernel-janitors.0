From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 16 Aug 2010 19:31:01 +0000
Subject: Re: [PATCH 13/16] net/ax25: Use available error codes
Message-Id: <20100816193100.GB10921@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008161828030.19313@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008161828030.19313@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 16, 2010 at 06:28:19PM +0200, Julia Lawall wrote:

> Error codes are stored in err, but the return value is always 0.  Return
> err instead.
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
> This changes the semantics of the function and has not been tested.

It restores the semantics to what they should be and used to be.  This
probably happened during the introduction of proper refcounting and
locking into the AX.25 stack.  Looks fine to me.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
