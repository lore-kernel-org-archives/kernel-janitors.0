From: Sage Weil <sage@newdream.net>
Date: Wed, 25 Aug 2010 19:01:07 +0000
Subject: Re: [patch] ceph: ceph_get_inode() returns an ERR_PTR
Message-Id: <Pine.LNX.4.64.1008251201020.19762@cobra.newdream.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100825071135.GO29330@bicker>
In-Reply-To: <20100825071135.GO29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Yehuda Sadeh <yehuda@hq.newdream.net>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks, queueing this up!

sage


On Wed, 25 Aug 2010, Dan Carpenter wrote:

> ceph_get_inode() returns an ERR_PTR and it doesn't return a NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> index 5d893d3..1e623ec 100644
> --- a/fs/ceph/inode.c
> +++ b/fs/ceph/inode.c
> @@ -1229,11 +1229,11 @@ retry_lookup:
>  			in = dn->d_inode;
>  		} else {
>  			in = ceph_get_inode(parent->d_sb, vino);
> -			if (in = NULL) {
> +			if (IS_ERR(in)) {
>  				dout("new_inode badness\n");
>  				d_delete(dn);
>  				dput(dn);
> -				err = -ENOMEM;
> +				err = PTR_ERR(in);
>  				goto out;
>  			}
>  			dn = splice_dentry(dn, in, NULL);
> --
> To unsubscribe from this list: send the line "unsubscribe ceph-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
