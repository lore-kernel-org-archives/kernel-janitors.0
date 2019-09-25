From: "J . Bruce Fields" <bfields@fieldses.org>
Date: Wed, 25 Sep 2019 15:13:22 +0000
Subject: Re: [PATCH] sunrpc: clean up indentation issue
Message-Id: <20190925151322.GA8581@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925130930.13076-1-colin.king@canonical.com>
In-Reply-To: <20190925130930.13076-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "David S . Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Applied, thanks.--b.

On Wed, Sep 25, 2019 at 02:09:30PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are statements that are indented incorrectly, remove the
> extraneous spacing.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/sunrpc/svc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
> index 220b79988000..d11b70552c33 100644
> --- a/net/sunrpc/svc.c
> +++ b/net/sunrpc/svc.c
> @@ -1233,8 +1233,8 @@ svc_generic_init_request(struct svc_rqst *rqstp,
>  
>  	if (rqstp->rq_vers >= progp->pg_nvers )
>  		goto err_bad_vers;
> -	  versp = progp->pg_vers[rqstp->rq_vers];
> -	  if (!versp)
> +	versp = progp->pg_vers[rqstp->rq_vers];
> +	if (!versp)
>  		goto err_bad_vers;
>  
>  	/*
> -- 
> 2.20.1
