From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Wed, 26 Aug 2020 12:33:40 +0000
Subject: Re: [PATCH] afs: Remove erroneous fallthough annotation
Message-Id: <73c80979-da30-c7f5-eeac-9182076df023@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826113214.GB393664@mwanda>
In-Reply-To: <20200826113214.GB393664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 8/26/20 06:32, Dan Carpenter wrote:
> The fall through annotation comes after a return statement so it's not
> reachable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  fs/afs/flock.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/afs/flock.c b/fs/afs/flock.c
> index eff82a6839e4..cb3054c7843e 100644
> --- a/fs/afs/flock.c
> +++ b/fs/afs/flock.c
> @@ -376,7 +376,6 @@ void afs_lock_work(struct work_struct *work)
>  		spin_unlock(&vnode->lock);
>  		return;
>  
> -		fallthrough;
>  	default:
>  		/* Looks like a lock request was withdrawn. */
>  		spin_unlock(&vnode->lock);
> 
