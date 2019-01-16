From: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 16 Jan 2019 15:18:37 +0000
Subject: Re: [PATCH net-next] xprtrdma: Fix error return code in rpcrdma_buffer_create()
Message-Id: <84778E0E-6A51-4348-94C6-57110599DAD3@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547635124-62243-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547635124-62243-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, Bruce Fields <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On Jan 16, 2019, at 5:38 AM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return a negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 6d2d0ee27c7a ("xprtrdma: Replace rpcrdma_receive_wq with a per-xprt workqueue")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I thought we'd already fixed this one, but:

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>


> ---
> net/sunrpc/xprtrdma/verbs.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
> index 7749a2b..3dde058 100644
> --- a/net/sunrpc/xprtrdma/verbs.c
> +++ b/net/sunrpc/xprtrdma/verbs.c
> @@ -1113,8 +1113,10 @@ struct rpcrdma_req *
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


--
Chuck Lever
