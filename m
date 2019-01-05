From: Chuck Lever <chuck.lever@oracle.com>
Date: Sat, 05 Jan 2019 16:17:09 +0000
Subject: Re: [PATCH 1/2] xprtrdma: Fix error code in rpcrdma_buffer_create()
Message-Id: <D028449F-114A-4014-9B97-A124740F3D70@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190105130607.GB3288@kadam>
In-Reply-To: <20190105130607.GB3288@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Jeff Layton <jlayton@kernel.org>, Anna Schumaker <anna.schumaker@netapp.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org


> On Jan 5, 2019, at 8:06 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> This should return -ENOMEM if __alloc_workqueue_key() fails, but it
> returns success.
> 
> Fixes: 6d2d0ee27c7a ("xprtrdma: Replace rpcrdma_receive_wq with a per-xprt workqueue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed.

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>


> ---
> net/sunrpc/xprtrdma/verbs.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
> index 7749a2bf6887..3dde05892c8e 100644
> --- a/net/sunrpc/xprtrdma/verbs.c
> +++ b/net/sunrpc/xprtrdma/verbs.c
> @@ -1113,8 +1113,10 @@ rpcrdma_buffer_create(struct rpcrdma_xprt *r_xprt)
> 						WQ_MEM_RECLAIM | WQ_HIGHPRI,
> 						0,
> 			r_xprt->rx_xprt.address_strings[RPC_DISPLAY_ADDR]);
> -	if (!buf->rb_completion_wq)
> +	if (!buf->rb_completion_wq) {
> +		rc = -ENOMEM;
> 		goto out;
> +	}
> 
> 	return 0;
> out:
> -- 
> 2.17.1
> 

--
Chuck Lever
