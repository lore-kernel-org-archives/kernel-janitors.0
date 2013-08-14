From: "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 14 Aug 2013 11:57:57 +0000
Subject: Re: [patch] efs: iget_locked() doesn't return an ERR_PTR()
Message-Id: <20130814115757.GA16458@mail.hallyn.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814094940.GF521@elgon.mountain>
In-Reply-To: <20130814094940.GF521@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Serge Hallyn <serge.hallyn@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (dan.carpenter@oracle.com):
> The iget_locked() function returns NULL on error and never an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Serge Hallyn <serge.hallyn@canonical.com>

> diff --git a/fs/efs/inode.c b/fs/efs/inode.c
> index f3913eb..d15ccf2 100644
> --- a/fs/efs/inode.c
> +++ b/fs/efs/inode.c
> @@ -57,7 +57,7 @@ struct inode *efs_iget(struct super_block *super, unsigned long ino)
>  	struct inode *inode;
>  
>  	inode = iget_locked(super, ino);
> -	if (IS_ERR(inode))
> +	if (!inode)
>  		return ERR_PTR(-ENOMEM);
>  	if (!(inode->i_state & I_NEW))
>  		return inode;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
