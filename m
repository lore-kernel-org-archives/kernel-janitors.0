From: Chuck Lever <chuck.lever@oracle.com>
Date: Thu, 13 Jul 2017 17:53:10 +0000
Subject: Re: [PATCH][net-next] svcrdma: fix an incorrect check on -E2BIG and -EINVAL
Message-Id: <1D2A804A-9BEC-4D34-AF01-960F35E297E7@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713175115.9044-1-colin.king@canonical.com>
In-Reply-To: <20170713175115.9044-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, Anna Schumaker <anna.schumaker@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@poochiereds.net>, "David S . Miller" <davem@davemloft.net>, Sagi Grimberg <sagi@grimberg.me>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


> On Jul 13, 2017, at 1:51 PM, Colin King <colin.king@canonical.com> wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The current check will always be true and will always jump to
> err1, this looks dubious to me. I believe && should be used
> instead of ||.
> 
> Detected by CoverityScan, CID#1450120 ("Logically Dead Code")
> 
> Fixes: 107c1d0a991a ("svcrdma: Avoid Send Queue overflow")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>

Dan reported this today, and I have a similar patch in my
"pending for-rc" series. This one works too.


> ---
> net/sunrpc/xprtrdma/svc_rdma_sendto.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/sunrpc/xprtrdma/svc_rdma_sendto.c b/net/sunrpc/xprtrdma/svc_rdma_sendto.c
> index 19fd01e4b690..7c3a211e0e9a 100644
> --- a/net/sunrpc/xprtrdma/svc_rdma_sendto.c
> +++ b/net/sunrpc/xprtrdma/svc_rdma_sendto.c
> @@ -684,7 +684,7 @@ int svc_rdma_sendto(struct svc_rqst *rqstp)
> 	return 0;
> 
>  err2:
> -	if (ret != -E2BIG || ret != -EINVAL)
> +	if (ret != -E2BIG && ret != -EINVAL)
> 		goto err1;
> 
> 	ret = svc_rdma_post_recv(rdma, GFP_KERNEL);
> -- 
> 2.11.0
> 

--
Chuck Lever



