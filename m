From: Sage Weil <sage@newdream.net>
Date: Thu, 26 Aug 2010 16:30:12 +0000
Subject: Re: [patch] ceph: ceph_mdsc_build_path() returns an ERR_PTR
Message-Id: <Pine.LNX.4.64.1008260930060.22216@cobra.newdream.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100826090724.GA20072@bicker>
In-Reply-To: <20100826090724.GA20072@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Yehuda Sadeh <yehuda@hq.newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

Applied, thanks!
sage

On Thu, 26 Aug 2010, Dan Carpenter wrote:

> ceph_mdsc_build_path() returns an ERR_PTR but this code is set up to
> handle NULL returns.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/ceph/debugfs.c b/fs/ceph/debugfs.c
> index 360c4f2..6fd8b20 100644
> --- a/fs/ceph/debugfs.c
> +++ b/fs/ceph/debugfs.c
> @@ -171,6 +171,8 @@ static int mdsc_show(struct seq_file *s, void *p)
>  		} else if (req->r_dentry) {
>  			path = ceph_mdsc_build_path(req->r_dentry, &pathlen,
>  						    &pathbase, 0);
> +			if (IS_ERR(path))
> +				path = NULL;
>  			spin_lock(&req->r_dentry->d_lock);
>  			seq_printf(s, " #%llx/%.*s (%s)",
>  				   ceph_ino(req->r_dentry->d_parent->d_inode),
> @@ -187,6 +189,8 @@ static int mdsc_show(struct seq_file *s, void *p)
>  		if (req->r_old_dentry) {
>  			path = ceph_mdsc_build_path(req->r_old_dentry, &pathlen,
>  						    &pathbase, 0);
> +			if (IS_ERR(path))
> +				path = NULL;
>  			spin_lock(&req->r_old_dentry->d_lock);
>  			seq_printf(s, " #%llx/%.*s (%s)",
>  			   ceph_ino(req->r_old_dentry->d_parent->d_inode),
> --
> To unsubscribe from this list: send the line "unsubscribe ceph-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
