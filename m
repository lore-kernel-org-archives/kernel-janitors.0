From: ebiederm@xmission.com (Eric W. Biederman)
Date: Wed, 25 Aug 2010 08:42:31 +0000
Subject: Re: [patch] sysfs: checking for NULL instead of ERR_PTR
Message-Id: <m1d3t7f5hk.fsf@fess.ebiederm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100825071229.GP29330@bicker>
In-Reply-To: <20100825071229.GP29330@bicker> (Dan Carpenter's message of "Wed,
	25 Aug 2010 09:12:29 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Serge Hallyn <serue@us.ibm.com>, Stephen Hemminger <shemminger@vyatta.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> writes:

> d_path() returns an ERR_PTR and it doesn't return NULL.
>
> CC:stable@kernel.org
> Signed-off-by: Dan Carpenter <error27@gmail.com>

This is definitely a needed bug fix.

Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>

If we ever get ERR_PTR(-ENAMETOOLONG) and this case actually matters 
something is very wrong with sysfs, but that is another story.

Eric


> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 1b27b56..da3fefe 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -340,7 +340,7 @@ static int sysfs_open_file(struct inode *inode, struct file *file)
>  	char *p;
>  
>  	p = d_path(&file->f_path, last_sysfs_file, sizeof(last_sysfs_file));
> -	if (p)
> +	if (!IS_ERR(p))
>  		memmove(last_sysfs_file, p, strlen(p) + 1);
>  
>  	/* need attr_sd for attr and ops, its parent for kobj */
