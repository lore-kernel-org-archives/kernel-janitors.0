From: Anna Schumaker <Anna.Schumaker@netapp.com>
Date: Fri, 06 Nov 2015 18:34:50 +0000
Subject: Re: [patch 2/2] xprtrdma: checking for NULL instead of IS_ERR()
Message-Id: <563CF2CA.5050409@Netapp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151105083952.GB19405@mwanda>
In-Reply-To: <20151105083952.GB19405@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Trond Myklebust <trond.myklebust@primarydata.com>, Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@poochiereds.net>, Anna Schumaker <anna.schumaker@netapp.com>, Sagi Grimberg <sagig@mellanox.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/05/2015 03:39 AM, Dan Carpenter wrote:
> The rpcrdma_create_req() function returns error pointers or success.  It
> never returns NULL.
> 
> Fixes: f531a5dbc451 ('xprtrdma: Pre-allocate backward rpc_rqst and send/receive buffers')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan! These patches don't look urgent, so if it's okay with you then I'll save them for 4.5.

Anna

> 
> diff --git a/net/sunrpc/xprtrdma/backchannel.c b/net/sunrpc/xprtrdma/backchannel.c
> index 2dcb44f..97554ca 100644
> --- a/net/sunrpc/xprtrdma/backchannel.c
> +++ b/net/sunrpc/xprtrdma/backchannel.c
> @@ -42,8 +42,8 @@ static int rpcrdma_bc_setup_rqst(struct rpcrdma_xprt *r_xprt,
>  	size_t size;
>  
>  	req = rpcrdma_create_req(r_xprt);
> -	if (!req)
> -		return -ENOMEM;
> +	if (IS_ERR(req))
> +		return PTR_ERR(req);
>  	req->rl_backchannel = true;
>  
>  	size = RPCRDMA_INLINE_WRITE_THRESHOLD(rqst);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

