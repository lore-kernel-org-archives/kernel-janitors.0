From: ebiederm@xmission.com (Eric W. Biederman)
Date: Thu, 31 May 2018 11:51:07 +0000
Subject: Re: [PATCH] autofs: small cleanup in autofs_getpath()
Message-Id: <878t80f3h0.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531064736.lnisb55eajwjynvk@kili.mountain>
In-Reply-To: <20180531064736.lnisb55eajwjynvk@kili.mountain> (Dan Carpenter's
        message of "Thu, 31 May 2018 09:47:36 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ian Kent <raven@themaw.net>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Ingo Molnar <mingo@kernel.org>, NeilBrown <neilb@suse.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We don't set "*name" so it's slightly nicer to just pass "name" instead
> of "&name".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

This seems like an obvious and reasonable cleanup.

> diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
> index 8c858126c751..f6385c6ef0a5 100644
> --- a/fs/autofs/waitq.c
> +++ b/fs/autofs/waitq.c
> @@ -179,7 +179,7 @@ static void autofs_notify_daemon(struct autofs_sb_info *sbi,
>  }
>  
>  static int autofs_getpath(struct autofs_sb_info *sbi,
> -			  struct dentry *dentry, char **name)
> +			  struct dentry *dentry, char *name)
>  {
>  	struct dentry *root = sbi->sb->s_root;
>  	struct dentry *tmp;
> @@ -189,7 +189,7 @@ static int autofs_getpath(struct autofs_sb_info *sbi,
>  	unsigned seq;
>  
>  rename_retry:
> -	buf = *name;
> +	buf = name;
>  	len = 0;
>  
>  	seq = read_seqbegin(&rename_lock);
> @@ -395,7 +395,7 @@ int autofs_wait(struct autofs_sb_info *sbi,
>  	if (IS_ROOT(dentry) && autofs_type_trigger(sbi->type))
>  		qstr.len = sprintf(name, "%p", dentry);
>  	else {
> -		qstr.len = autofs_getpath(sbi, dentry, &name);
> +		qstr.len = autofs_getpath(sbi, dentry, name);
>  		if (!qstr.len) {
>  			kfree(name);
>  			return -ENOENT;
