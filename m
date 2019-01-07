From: Bruce Fields <bfields@fieldses.org>
Date: Mon, 07 Jan 2019 17:22:53 +0000
Subject: Re: [PATCH 2/2] xprtrdma: Double free in rpcrdma_sendctxs_create()
Message-Id: <20190107172253.GA7196@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190105130648.GC3288@kadam>
 <0CEEB35A-2083-4888-9035-8A9ADF22E8E3@oracle.com>
In-Reply-To: <0CEEB35A-2083-4888-9035-8A9ADF22E8E3@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jeff Layton <jlayton@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 05, 2019 at 11:24:45AM -0500, Chuck Lever wrote:
> 
> > On Jan 5, 2019, at 8:06 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > The clean up is handled by the caller, rpcrdma_buffer_create(), so this
> > call to rpcrdma_sendctxs_destroy() leads to a double free.
> 
> True. This fix is adequate, but I'm wondering if rpcrdma_sendctxs_destroy
> should be made more careful about being called twice. Hm.
> 
> Reviewed-by: Chuck Lever <chuck.lever@oracle.com>

I'm assuming Trond or Anna will pick this up.--b.

> 
> 
> > Fixes: ae72950abf99 ("xprtrdma: Add data structure to manage RDMA Send arguments")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > net/sunrpc/xprtrdma/verbs.c | 6 +-----
> > 1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
> > index 3dde05892c8e..4994e75945b8 100644
> > --- a/net/sunrpc/xprtrdma/verbs.c
> > +++ b/net/sunrpc/xprtrdma/verbs.c
> > @@ -845,17 +845,13 @@ static int rpcrdma_sendctxs_create(struct rpcrdma_xprt *r_xprt)
> > 	for (i = 0; i <= buf->rb_sc_last; i++) {
> > 		sc = rpcrdma_sendctx_create(&r_xprt->rx_ia);
> > 		if (!sc)
> > -			goto out_destroy;
> > +			return -ENOMEM;
> > 
> > 		sc->sc_xprt = r_xprt;
> > 		buf->rb_sc_ctxs[i] = sc;
> > 	}
> > 
> > 	return 0;
> > -
> > -out_destroy:
> > -	rpcrdma_sendctxs_destroy(buf);
> > -	return -ENOMEM;
> > }
> > 
> > /* The sendctx queue is not guaranteed to have a size that is a
> > -- 
> > 2.17.1
> > 
> 
> --
> Chuck Lever
> 
> 
