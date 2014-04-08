From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Apr 2014 14:26:56 +0000
Subject: Re: [patch] ncpfs: cleanup indenting in ncp_lookup()
Message-Id: <20140408142656.GI4963@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140217201128.GA27455@elgon.mountain>
In-Reply-To: <20140217201128.GA27455@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Dave Chiluk <chiluk@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Ping?

regards,
dan carpenter

On Mon, Feb 17, 2014 at 11:11:28PM +0300, Dan Carpenter wrote:
> My static checker suggests adding curly braces here.  Probably that was
> the intent, but actually the code works the same either way.  I've just
> changed the indenting and left the code as-is.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/ncpfs/dir.c b/fs/ncpfs/dir.c
> index 91441de2529c..08b8ea8c353e 100644
> --- a/fs/ncpfs/dir.c
> +++ b/fs/ncpfs/dir.c
> @@ -849,8 +849,8 @@ static struct dentry *ncp_lookup(struct inode *dir, struct dentry *dentry, unsig
>  				 dentry->d_name.len, 1);
>  		if (!res)
>  			res = ncp_lookup_volume(server, __name, &(finfo.i));
> -			if (!res)
> -				ncp_update_known_namespace(server, finfo.i.volNumber, NULL);
> +		if (!res)
> +			ncp_update_known_namespace(server, finfo.i.volNumber, NULL);
>  	} else {
>  		res = ncp_io2vol(server, __name, &len, dentry->d_name.name,
>  				 dentry->d_name.len, !ncp_preserve_case(dir));
