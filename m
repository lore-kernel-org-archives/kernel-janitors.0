From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Wed, 26 Sep 2018 00:35:35 +0000
Subject: Re: [PATCH -next] nfsd: remove set but not used variable 'dirp'
Message-Id: <20180926003535.GC9559@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537874573-182553-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537874573-182553-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks, applying for 4.20.--b.

On Tue, Sep 25, 2018 at 11:22:53AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/nfsd/vfs.c: In function 'nfsd_create':
> fs/nfsd/vfs.c:1279:16: warning:
>  variable 'dirp' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/nfsd/vfs.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index b53e763..d74583f 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -1276,7 +1276,6 @@ __be32 nfsd_read(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  		int type, dev_t rdev, struct svc_fh *resfhp)
>  {
>  	struct dentry	*dentry, *dchild = NULL;
> -	struct inode	*dirp;
>  	__be32		err;
>  	int		host_err;
>  
> @@ -1288,7 +1287,6 @@ __be32 nfsd_read(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  		return err;
>  
>  	dentry = fhp->fh_dentry;
> -	dirp = d_inode(dentry);
>  
>  	host_err = fh_want_write(fhp);
>  	if (host_err)
