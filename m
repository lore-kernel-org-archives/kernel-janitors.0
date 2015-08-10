From: Ashish Samant <ashish.samant@oracle.com>
Date: Mon, 10 Aug 2015 18:45:58 +0000
Subject: Re: [fuse-devel] [patch] fuse: fix an error code in fuse_lookup_name()
Message-Id: <55C8F166.4060203@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150808130134.GA8034@mwanda>
In-Reply-To: <20150808130134.GA8034@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Reviewed-by: Ashish Samant <ashish.samant@oracle.com>
On 08/08/2015 06:01 AM, Dan Carpenter wrote:
> This is a static checker fix because we check "outarg->nodeid" here and
> then again a in the next if statement.  The difference is that for this
> first one we don't set the error code.
>
> Fixes: c180eebe1390 ('fuse: add fuse_lookup_name() helper')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 5e2e087..225fc703 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -306,8 +306,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, struct qstr *name,
>   
>   	fuse_lookup_init(fc, &args, nodeid, name, outarg);
>   	err = fuse_simple_request(fc, &args);
> -	/* Zero nodeid is same as -ENOENT, but with valid timeout */
> -	if (err || !outarg->nodeid)
> +	if (err)
>   		goto out_put_forget;
>   
>   	err = -EIO;
>
> ------------------------------------------------------------------------------
> _______________________________________________
> fuse-devel mailing list
> fuse-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/fuse-devel
>

