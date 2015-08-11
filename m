From: Jan Kara <jack@suse.cz>
Date: Tue, 11 Aug 2015 08:03:11 +0000
Subject: Re: [patch] quota: remove an unneeded condition
Message-Id: <20150811080311.GC2650@quack.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150810212955.GA31724@mwanda>
In-Reply-To: <20150810212955.GA31724@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue 11-08-15 00:29:55, Dan Carpenter wrote:
> We know "ret" is zero here so we can remove this condition.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks. I've added the patch to my tree.

								Honza

> diff --git a/fs/quota/quota.c b/fs/quota/quota.c
> index 86ded73..3746367 100644
> --- a/fs/quota/quota.c
> +++ b/fs/quota/quota.c
> @@ -141,9 +141,9 @@ static int quota_getinfo(struct super_block *sb, int type, void __user *addr)
>  	if (tstate->flags & QCI_ROOT_SQUASH)
>  		uinfo.dqi_flags |= DQF_ROOT_SQUASH;
>  	uinfo.dqi_valid = IIF_ALL;
> -	if (!ret && copy_to_user(addr, &uinfo, sizeof(uinfo)))
> +	if (copy_to_user(addr, &uinfo, sizeof(uinfo)))
>  		return -EFAULT;
> -	return ret;
> +	return 0;
>  }
>  
>  static int quota_setinfo(struct super_block *sb, int type, void __user *addr)
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
