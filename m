From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 May 2017 14:04:14 +0000
Subject: Re: [PATCH] nfsd: avoid out of bounds read on array nfsd4_layout_ops
Message-Id: <20170509140414.ycw4z6zsdevbkozm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170509133121.26529-1-colin.king@canonical.com>
In-Reply-To: <20170509133121.26529-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ari Kauppi <ari@synopsys.com>, "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 09, 2017 at 02:31:21PM +0100, Colin King wrote:
> diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
> index 1dbf62190bee..c453a1998e00 100644
> --- a/fs/nfsd/nfs4proc.c
> +++ b/fs/nfsd/nfs4proc.c
> @@ -1259,7 +1259,8 @@ nfsd4_layout_verify(struct svc_export *exp, unsigned int layout_type)
>  		return NULL;
>  	}
>  
> -	if (layout_type >= 32 || !(exp->ex_layout_types & (1 << layout_type))) {
> +	if (layout_type >= LAYOUT_TYPE_MAX ||
> +	    !(exp->ex_layout_types & (1 << layout_type))) {

The 32 is there to prevent a shift wrapping bug.  The bit test prevents
a buffer overflow so this can't actually overflow.  But this change
doesn't hurt and is probably cleaner.

exp->ex_layout_types  is set in nfsd4_setup_layout_type().

regards,
dan carpenter

