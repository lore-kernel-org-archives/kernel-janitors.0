From: David Miller <davem@davemloft.net>
Date: Mon, 01 Aug 2011 09:27:52 +0000
Subject: Re: [PATCH 1/6] net: adjust array index
Message-Id: <20110801.022752.1007506557598017442.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311857165-14780-1-git-send-email-julia@diku.dk>
	<1311857165-14780-2-git-send-email-julia@diku.dk>
In-Reply-To: <1311857165-14780-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: kernel-janitors@vger.kernel.org, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 14:46:01 +0200

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
