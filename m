From: Chuck Lever <chuck.lever@oracle.com>
Date: Sun, 20 Sep 2020 15:37:56 +0000
Subject: Re: [PATCH 08/14] xprtrdma: drop double zeroing
Message-Id: <CC88D365-0362-4CD8-9B72-0EE8B51BF481@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-9-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-9-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Anna Schumaker <anna.schumaker@netapp.com>
Cc: Bruce Fields <bfields@fieldses.org>, kernel-janitors@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Thanks, Julia!

> On Sep 20, 2020, at 7:26 AM, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> 
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,n,flags;
> @@
> 
> x = 
> - kcalloc
> + kmalloc_array
>  (n,sizeof(*x),flags)
> ...
> sg_init_table(x,n)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Chuck Lever <chuck.lever@oracle.com>

This one goes to Anna.


> ---
> net/sunrpc/xprtrdma/frwr_ops.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/net/sunrpc/xprtrdma/frwr_ops.c b/net/sunrpc/xprtrdma/frwr_ops.c
> --- a/net/sunrpc/xprtrdma/frwr_ops.c
> +++ b/net/sunrpc/xprtrdma/frwr_ops.c
> @@ -124,7 +124,7 @@ int frwr_mr_init(struct rpcrdma_xprt *r_
> 	if (IS_ERR(frmr))
> 		goto out_mr_err;
> 
> -	sg = kcalloc(depth, sizeof(*sg), GFP_NOFS);
> +	sg = kmalloc_array(depth, sizeof(*sg), GFP_NOFS);
> 	if (!sg)
> 		goto out_list_err;
> 
> 

--
Chuck Lever
