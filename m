From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Fri, 04 Jan 2019 15:03:44 +0000
Subject: Re: [PATCH] nfsd: fix an IS_ERR() vs NULL check
Message-Id: <20190104150344.GA11787@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190104064703.GB30627@kadam>
In-Reply-To: <20190104064703.GB30627@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: NeilBrown <neilb@suse.com>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 04, 2019 at 09:47:03AM +0300, Dan Carpenter wrote:
> The get_backchannel_cred() used to return error pointers on error but
> now it returns NULL pointers.

Thanks!  Queueing up for 4.21 and stable.

Off the top of my head I don't recall bug reports that could be
explained by this.  Perhaps it's hard to get a failure at this point
without failing somewhere earlier?  But I think it's likely possible to
trigger a NULL dereference somehow.

--b.

> 
> Fixes: 97f68c6b02e0 ("SUNRPC: add 'struct cred *' to auth_cred and rpc_cre")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/nfsd/nfs4callback.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/nfsd/nfs4callback.c b/fs/nfsd/nfs4callback.c
> index c74e4538d0eb..9b38dab1c21b 100644
> --- a/fs/nfsd/nfs4callback.c
> +++ b/fs/nfsd/nfs4callback.c
> @@ -913,9 +913,9 @@ static int setup_callback_client(struct nfs4_client *clp, struct nfs4_cb_conn *c
>  		return PTR_ERR(client);
>  	}
>  	cred = get_backchannel_cred(clp, client, ses);
> -	if (IS_ERR(cred)) {
> +	if (!cred) {
>  		rpc_shutdown_client(client);
> -		return PTR_ERR(cred);
> +		return -ENOMEM;
>  	}
>  	clp->cl_cb_client = client;
>  	clp->cl_cb_cred = cred;
> -- 
> 2.17.1
