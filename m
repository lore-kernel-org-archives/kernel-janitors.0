From: John Johansen <john.johansen@canonical.com>
Date: Tue, 23 May 2017 18:38:57 +0000
Subject: Re: [PATCH] apparmor: Fix error cod in __aa_fs_profile_mkdir()
Message-Id: <276ad893-7c4b-5980-fd4a-8bfaab8af0bb@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170523143346.GB28152@elgon.mountain>
In-Reply-To: <20170523143346.GB28152@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On 05/23/2017 07:33 AM, Dan Carpenter wrote:
> We can either return PTR_ERR(NULL) or a PTR_ERR(a valid pointer) here.
> Returning NULL is probably not good, but since this happens at boot
> then we are probably already toasted if we were to hit this bug in real
> life.  In other words, it seems like a very low severity bug to me.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

yep,

Acked-by: John Johansen <john.johansen@canonical.com>

and puled into my tree

> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 4f6ac9dbc65d..18f0d105084d 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -728,8 +728,10 @@ int __aa_fs_profile_mkdir(struct aa_profile *profile, struct dentry *parent)
>  		id_len = snprintf(NULL, 0, ".%ld", profile->ns->uniq_id);
>  
>  		profile->dirname = kmalloc(len + id_len + 1, GFP_KERNEL);
> -		if (!profile->dirname)
> -			goto fail;
> +		if (!profile->dirname) {
> +			error = -ENOMEM;
> +			goto fail2;
> +		}
>  
>  		mangle_name(profile->base.name, profile->dirname);
>  		sprintf(profile->dirname + len, ".%ld", profile->ns->uniq_id++);
> 

