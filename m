From: David Miller <davem@davemloft.net>
Date: Mon, 01 Aug 2011 09:27:59 +0000
Subject: Re: [PATCH 3/6] drivers/net/niu.c: adjust array index
Message-Id: <20110801.022759.1366729474517785485.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311857165-14780-1-git-send-email-julia@diku.dk>
	<1311857165-14780-4-git-send-email-julia@diku.dk>
In-Reply-To: <1311857165-14780-4-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia-dAYI7NvHqcQ@public.gmane.org
Cc: eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, bhutchings-s/n/eUQHGBpZroRs9YW3xA@public.gmane.org, shemminger-ZtmgI6mnKB3QT0dZR+AlfA@public.gmane.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 14:46:03 +0200

> From: Julia Lawall <julia@diku.dk>
> 
> Convert array index from the loop bound to the loop index.
> 
> A simplified version of the semantic patch that fixes this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e1,e2,ar;
> @@
> 
> for(e1 = 0; e1 < e2; e1++) { <...
>   ar[
> - e2
> + e1
>   ]
>   ...> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
