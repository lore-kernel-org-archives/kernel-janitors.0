From: Jon Maloy <jon.maloy@ericsson.com>
Date: Fri, 17 Jun 2016 12:01:22 +0000
Subject: RE: [patch -next] tipc: potential shift wrapping bug in map_set()
Message-Id: <A2BAEFC30C8FD34388F02C9B3121859D224A9483@eusaamb103.ericsson.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617092226.GD25609@mwanda>
In-Reply-To: <20160617092226.GD25609@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, "David S. Miller" <davem@davemloft.net>

Acked.  This will only be relevant in clusters > 1000 nodes, which I must admit I haven't tested yet.

///jon

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Friday, 17 June, 2016 05:22
> To: Jon Maloy
> Cc: Ying Xue; David S. Miller; netdev@vger.kernel.org; tipc-
> discussion@lists.sourceforge.net; kernel-janitors@vger.kernel.org
> Subject: [patch -next] tipc: potential shift wrapping bug in map_set()
> 
> "up_map" is a u64 type but we're not using the high 32 bits.
> 
> Fixes: 35c55c9877f8 ('tipc: add neighbor monitoring framework')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
> index 87d4efe..0d489e8 100644
> --- a/net/tipc/monitor.c
> +++ b/net/tipc/monitor.c
> @@ -122,8 +122,8 @@ static int dom_size(int peers)
> 
>  static void map_set(u64 *up_map, int i, unsigned int v)
>  {
> -	*up_map &= ~(1 << i);
> -	*up_map |= (v << i);
> +	*up_map &= ~(1ULL << i);
> +	*up_map |= ((u64)v << i);
>  }
> 
>  static int map_get(u64 up_map, int i)
