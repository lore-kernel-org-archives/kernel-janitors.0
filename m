From: walter harms <wharms@bfs.de>
Date: Sat, 11 Feb 2017 11:05:36 +0000
Subject: Re: [PATCH] ovl: Avoid some memory allocation
Message-Id: <589EF000.7050808@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170210211814.18257-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170210211814.18257-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 10.02.2017 22:18, schrieb Christophe JAILLET:
> Reorder code to avoid allocating and then freeing some memory in an error
> handling path.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  fs/overlayfs/namei.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index 023bb0b03352..ba80ebb8a104 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -35,13 +35,13 @@ static int ovl_check_redirect(struct dentry *dentry, struct ovl_lookup_data *d,
>  			return 0;
>  		goto fail;
>  	}
> +	if (res = 0)
> +		goto invalid;
> +


perhaps:

   if (res = -ENODATA || res = -EOPNOTSUPP)
	return 0;
	
   if (ret < 0)
	goto fail;

   if (ret = 0)
	goto invalid;

I think its better to read, i guess the author also as we can find this
pattern after the other vfs_getxattr() also.

re,
 wh

>  	buf = kzalloc(prelen + res + strlen(post) + 1, GFP_TEMPORARY);
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	if (res = 0)
> -		goto invalid;
> -
>  	res = vfs_getxattr(dentry, OVL_XATTR_REDIRECT, buf, res);
>  	if (res < 0)
>  		goto fail;
