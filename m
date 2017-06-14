From: John Johansen <john.johansen@canonical.com>
Date: Wed, 14 Jun 2017 14:44:52 +0000
Subject: Re: [PATCH] apparmor: fix error code in aafs_create()
Message-Id: <a58aedd0-3a53-d1de-6303-4d287ce6c6c6@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614104002.GL29394@elgon.mountain>
In-Reply-To: <20170614104002.GL29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On 06/14/2017 03:40 AM, Dan Carpenter wrote:
> We accidentally return ERR_PTR(0) if lookup_one_len() fails.  The caller
> is expecting error pointers so it likely causes problems later on.  For
> example, on one path I saw it triggered an AA_BUG().
> 
> Fixes: a481f4d91783 ("apparmor: add custom apparmorfs that will be used by policy namespace files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: John Johansen <john.johansen@canonical.com>

I'll pull this in and forward it up to James along with a couple of other
bug fixes

thanks

> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 853c2ec8e0c9..2caeb748070c 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -248,8 +248,10 @@ static struct dentry *aafs_create(const char *name, umode_t mode,
>  
>  	inode_lock(dir);
>  	dentry = lookup_one_len(name, parent, strlen(name));
> -	if (IS_ERR(dentry))
> +	if (IS_ERR(dentry)) {
> +		error = PTR_ERR(dentry);
>  		goto fail_lock;
> +	}
>  
>  	if (d_really_is_positive(dentry)) {
>  		error = -EEXIST;
> 

