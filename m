From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Wed, 27 Oct 2010 21:50:25 +0000
Subject: Re: [patch] nfsd: fix NULL dereference in setattr()
Message-Id: <20101027215025.GB29477@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027211904.GJ6062@bicker>
In-Reply-To: <20101027211904.GJ6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 27, 2010 at 11:19:04PM +0200, Dan Carpenter wrote:
> The original code would oops if this were called from nfsd4_setattr()
> because "filpp" is NULL.

I believe it's impossible to reach this case: we never give out write
delegations, so the preceding nfs4_check_delegmode will always fail when
called from setattr.

We should do this anyway, but I'll probably queue it up for the next
merge window.

--b.

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 9019e8e..e044d04 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -3083,9 +3083,10 @@ nfs4_preprocess_stateid_op(struct nfsd4_compound_state *cstate,
>  		if (status)
>  			goto out;
>  		renew_client(dp->dl_client);
> -		if (filpp)
> +		if (filpp) {
>  			*filpp = find_readable_file(dp->dl_file);
> -		BUG_ON(!*filpp);
> +			BUG_ON(!*filpp);
> +		}
>  	} else { /* open or lock stateid */
>  		stp = find_stateid(stateid, flags);
>  		if (!stp)
