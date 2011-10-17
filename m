From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Mon, 17 Oct 2011 12:35:46 +0000
Subject: Re: [patch] nfsd4: typo logical vs bitwise negate
Message-Id: <20111017123546.GA9809@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111017074117.GA11912@elgon.mountain>
In-Reply-To: <20111017074117.GA11912@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 17, 2011 at 10:41:17AM +0300, Dan Carpenter wrote:
> This should be a bitwise negate here.  It silences a Sparse warning:
> fs/nfsd/nfs4xdr.c:693:16: warning: dubious: x & !y

Whoops, thanks for catching that!

Applying for 3.2.--b.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
> index 2cab33c..645a0a9 100644
> --- a/fs/nfsd/nfs4xdr.c
> +++ b/fs/nfsd/nfs4xdr.c
> @@ -690,7 +690,7 @@ static __be32 nfsd4_decode_share_deny(struct nfsd4_compoundargs *argp, u32 *x)
>  	READ_BUF(4);
>  	READ32(*x);
>  	/* Note: unlinke access bits, deny bits may be zero. */
> -	if (*x & !NFS4_SHARE_DENY_BOTH)
> +	if (*x & ~NFS4_SHARE_DENY_BOTH)
>  		return nfserr_bad_xdr;
>  	return nfs_ok;
>  xdr_error:
