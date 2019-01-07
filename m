From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Jan 2019 18:41:48 +0000
Subject: Re: [PATCH 2/2] xprtrdma: Double free in rpcrdma_sendctxs_create()
Message-Id: <20190107184148.GC3253@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190105130648.GC3288@kadam>
 <0CEEB35A-2083-4888-9035-8A9ADF22E8E3@oracle.com>
In-Reply-To: <0CEEB35A-2083-4888-9035-8A9ADF22E8E3@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Bruce Fields <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

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

I actually wrote the patch like that originally, but then this way made
for an easier patch description so I re-wrote it.  Let me send the other
patch and you can apply that or both if you want.

regards,
dan carpenter
