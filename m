From: Jeff Moyer <jmoyer@redhat.com>
Date: Tue, 22 Mar 2016 17:26:37 +0000
Subject: Re: [patch] dax: silence an uninitialized variable warning
Message-Id: <x4937rictki.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160322113848.GA4519@mwanda>
In-Reply-To: <20160322113848.GA4519@mwanda> (Dan Carpenter's message of "Tue,
	22 Mar 2016 14:38:49 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@linux.intel.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> I'm not positive, but it looks like it might be possible to reach the
> end of this function and return an uninitialized value for "rc".  Anyway
> it causes a static checker warning and let's silence it.
>
> The warning was introduced in commit b2e0d1625e19 ('dax: fix lifetime of
> in-kernel dax mappings with dax_map_atomic()').
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me.

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>

>
> diff --git a/fs/dax.c b/fs/dax.c
> index 90322eb..3744e14 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -155,7 +155,8 @@ static ssize_t dax_io(struct inode *inode, struct iov_iter *iter,
>  	loff_t pos = start, max = start, bh_max = start;
>  	bool hole = false, need_wmb = false;
>  	struct block_device *bdev = NULL;
> -	int rw = iov_iter_rw(iter), rc;
> +	int rc = 0;
> +	int rw = iov_iter_rw(iter);
>  	long map_len = 0;
>  	struct blk_dax_ctl dax = {
>  		.addr = (void __pmem *) ERR_PTR(-EIO),
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
