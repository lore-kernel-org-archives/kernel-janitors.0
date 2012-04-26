From: Oliver Neukum <oliver@neukum.org>
Date: Thu, 26 Apr 2012 21:14:02 +0000
Subject: Re: [PATCH] GFS2: Return -ENOMEM only if kmalloc fails
Message-Id: <201204262314.02683.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335474778-6252-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1335474778-6252-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: swhiteho@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Donnerstag, 26. April 2012, 23:12:58 schrieb Emil Goode:
> The error variable should be assigned the value of -ENOMEM
> after the NULL check and not before.
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>  fs/gfs2/acl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
> index 230eb0f..90f6328 100644
> --- a/fs/gfs2/acl.c
> +++ b/fs/gfs2/acl.c
> @@ -174,8 +174,8 @@ int gfs2_acl_chmod(struct gfs2_inode *ip, struct iattr *attr)
>  
>  	len = posix_acl_to_xattr(acl, NULL, 0);
>  	data = kmalloc(len, GFP_NOFS);
> -	error = -ENOMEM;
>  	if (data = NULL)
> +		error = -ENOMEM;
>  		goto out;

Hint: read about the syntax of the if statement.
Secondly, consider how the compiler can optimize the original.

	Regards
		Oliver
