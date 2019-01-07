From: Chuck Lever <chuck.lever@oracle.com>
Date: Mon, 07 Jan 2019 21:25:19 +0000
Subject: Re: [PATCH] xprtrdma: Make rpcrdma_sendctxs_destroy() more robust
Message-Id: <E3C7A7BA-DECD-4EF6-96D8-A43681E56081@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190107190806.GA6094@kadam>
In-Reply-To: <20190107190806.GA6094@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Jeff Layton <jlayton@kernel.org>, Anna Schumaker <anna.schumaker@netapp.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org



> On Jan 7, 2019, at 2:08 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> There was a double free in the error handling here recently.  It was
> a bit subtle which function was supposed to call rpcrdma_sendctxs_destroy()
> so it was called in both.
> 
> This patch makes it so we can call rpcrdma_sendctxs_destroy() twice
> in a row without crashing.

Belt-and-braces. I think the other patch "must" be applied, and this
one "should" be applied.

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>


> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> net/sunrpc/xprtrdma/verbs.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
> index 7749a2bf6887..d05f4885548d 100644
> --- a/net/sunrpc/xprtrdma/verbs.c
> +++ b/net/sunrpc/xprtrdma/verbs.c
> @@ -802,9 +802,12 @@ static void rpcrdma_sendctxs_destroy(struct rpcrdma_buffer *buf)
> {
> 	unsigned long i;
> 
> +	if (!buf->rb_sc_ctxs)
> +		return;
> 	for (i = 0; i <= buf->rb_sc_last; i++)
> 		kfree(buf->rb_sc_ctxs[i]);
> 	kfree(buf->rb_sc_ctxs);
> +	buf->rb_sc_ctxs = NULL;
> }
> 
> static struct rpcrdma_sendctx *rpcrdma_sendctx_create(struct rpcrdma_ia *ia)
> -- 
> 2.17.1
> 

--
Chuck Lever
