From: Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 15 Jul 2020 16:40:18 +0000
Subject: Re: [PATCH] xprtrdma: fix incorrect header size calcations
Message-Id: <CAFX2Jfn75a8XENoqvztVnUe0aR9S2KGjpcGp3zyLeFS-h--9ag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200715162604.1080552-1-colin.king@canonical.com> <eb5d2ead-807b-3435-5024-b8cc4a1311f3@canonical.com>
In-Reply-To: <eb5d2ead-807b-3435-5024-b8cc4a1311f3@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

No need for a v2, I can fix it up!


On Wed, Jul 15, 2020 at 12:32 PM Colin Ian King
<colin.king@canonical.com> wrote:
>
> Bah, $SUBJECT typo "calcations" -> "calculations". can that be fixed up
> when it's applied, or shall I send a V2?
>
> On 15/07/2020 17:26, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the header size calculations are using an assignment
> > operator instead of a += operator when accumulating the header
> > size leading to incorrect sizes.  Fix this by using the correct
> > operator.
> >
> > Addresses-Coverity: ("Unused value")
> > Fixes: 302d3deb2068 ("xprtrdma: Prevent inline overflow")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  net/sunrpc/xprtrdma/rpc_rdma.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/sunrpc/xprtrdma/rpc_rdma.c b/net/sunrpc/xprtrdma/rpc_rdma.c
> > index 935bbef2f7be..453bacc99907 100644
> > --- a/net/sunrpc/xprtrdma/rpc_rdma.c
> > +++ b/net/sunrpc/xprtrdma/rpc_rdma.c
> > @@ -71,7 +71,7 @@ static unsigned int rpcrdma_max_call_header_size(unsigned int maxsegs)
> >       size = RPCRDMA_HDRLEN_MIN;
> >
> >       /* Maximum Read list size */
> > -     size = maxsegs * rpcrdma_readchunk_maxsz * sizeof(__be32);
> > +     size += maxsegs * rpcrdma_readchunk_maxsz * sizeof(__be32);
> >
> >       /* Minimal Read chunk size */
> >       size += sizeof(__be32); /* segment count */
> > @@ -94,7 +94,7 @@ static unsigned int rpcrdma_max_reply_header_size(unsigned int maxsegs)
> >       size = RPCRDMA_HDRLEN_MIN;
> >
> >       /* Maximum Write list size */
> > -     size = sizeof(__be32);          /* segment count */
> > +     size += sizeof(__be32);         /* segment count */
> >       size += maxsegs * rpcrdma_segment_maxsz * sizeof(__be32);
> >       size += sizeof(__be32); /* list discriminator */
> >
> >
>
