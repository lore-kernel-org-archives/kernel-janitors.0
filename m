From: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Jan 2016 15:36:49 +0000
Subject: Re: [patch -next] svcrdma: fix a couple warning messages
Message-Id: <80C8DCE5-5838-4045-A135-28A8960AA7A1@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105095249.GB23619@mwanda>
In-Reply-To: <20160105095249.GB23619@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Anna Schumaker <anna.schumaker@netapp.com>, Jeff Layton <jlayton@poochiereds.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Doug Ledford <dledford@redhat.com>, Steve Wise <swise@opengridcomputing.com>, Sagi Grimberg <sagig@mellanox.com>, Michael Wang <yun.wang@profitbricks.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org


> On Jan 5, 2016, at 4:52 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> The WARN_ON_ONCE() macro takes a condition, passing it this string
> literal sort of works as intended but it's better to use WARN_ONCE()
> instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan, I have to rebase and resubmit this series anyway.
I've squashed both your fixes into the original patches that
introduced the issues.

Thanks for reporting!


> diff --git a/net/sunrpc/xprtrdma/svc_rdma_transport.c b/net/sunrpc/xprtrdma/svc_rdma_transport.c
> index abfbd02..4b397ad 100644
> --- a/net/sunrpc/xprtrdma/svc_rdma_transport.c
> +++ b/net/sunrpc/xprtrdma/svc_rdma_transport.c
> @@ -221,7 +221,7 @@ out_empty:
> 	spin_lock_bh(&xprt->sc_ctxt_lock);
> 	xprt->sc_ctxt_used--;
> 	spin_unlock_bh(&xprt->sc_ctxt_lock);
> -	WARN_ON_ONCE("svcrdma: empty RDMA ctxt list?\n");
> +	WARN_ONCE(1, "svcrdma: empty RDMA ctxt list?\n");
> 	return NULL;
> }
> 
> @@ -328,7 +328,7 @@ out_empty:
> 	if (map)
> 		goto out;
> 
> -	WARN_ON_ONCE("svcrdma: empty request map list?\n");
> +	WARN_ONCE(1, "svcrdma: empty request map list?\n");
> 	return NULL;
> }
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Chuck Lever




