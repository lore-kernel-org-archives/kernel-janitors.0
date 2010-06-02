From: Casey Schaufler <casey@schaufler-ca.com>
Date: Wed, 02 Jun 2010 00:26:06 +0000
Subject: Re: [patch] smack: opt_dentry is never null in in smack_d_instantiate()
Message-Id: <4C05A51E.1040703@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601071404.GH5483@bicker>
In-Reply-To: <20100601071404.GH5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>, "David P. Quigley" <dpquigl@tycho.nsa.gov>, David Howells <dhowells@redhat.com>, Serge Hallyn <serue@us.ibm.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> This patch removes some unneeded code for if opt_dentry is null because
> that can never happen.
>
> The function dereferences "opt_dentry" earlier when it checks 
> "if (opt_dentry->d_parent = opt_dentry) {".  That code was added in
> 2008.
>
> This function called from security_d_instantiate().  I checked all the 
> places which call security_d_instantiate() and dentry is always non-null.
> I also checked the selinux version of this hook and there is a comment
> which says that dentry should be non-null if called from 
> d_instantiate().
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>   

Acked-by: Casey Schaufler <casey@schaufler-ca.com>

I have tested the change and not had any issues. I recall struggling
with this particular bit of code, but that was long enough ago that
the circumstances evade my memory. Thank you.

> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 0f2fc48..07abc9c 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -2191,7 +2191,7 @@ static void smack_ipc_getsecid(struct kern_ipc_perm *ipp, u32 *secid)
>  
>  /**
>   * smack_d_instantiate - Make sure the blob is correct on an inode
> - * @opt_dentry: unused
> + * @opt_dentry: dentry where inode will be attached
>   * @inode: the object
>   *
>   * Set the inode's security blob if it hasn't been done already.
> @@ -2310,20 +2310,10 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
>  		/*
>  		 * Get the dentry for xattr.
>  		 */
> -		if (opt_dentry = NULL) {
> -			dp = d_find_alias(inode);
> -			if (dp = NULL)
> -				break;
> -		} else {
> -			dp = dget(opt_dentry);
> -			if (dp = NULL)
> -				break;
> -		}
> -
> +		dp = dget(opt_dentry);
>  		fetched = smk_fetch(inode, dp);
>  		if (fetched != NULL)
>  			final = fetched;
> -
>  		dput(dp);
>  		break;
>  	}
>
>
>   

