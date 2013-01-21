From: Namjae Jeon <linkinjeon@gmail.com>
Date: Mon, 21 Jan 2013 00:39:43 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <CAKYAXd_Lp7f-cHi-1Cti29JjmXTWOgOOHxy-_f106jTSFdceDg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain>
In-Reply-To: <20130120150258.GB32551@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaegeuk Kim <jaegeuk.kim@samsung.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2013/1/21, Dan Carpenter <dan.carpenter@oracle.com>:
> This is calling list_del() inside a loop which is a problem when we try
> move to the next item on the list.  I've converted it to use the _safe
> version.  And also, as a cleanup, I've converted it to use
> list_for_each_entry instead of list_for_each.
>
Hi Dan.
I can't understand why this patch is needed yet.
Could you elaborate more ?

Thanks.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis stuff.  Untested.  Please review carefully.
>
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 6cc046d..f42e406 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -173,10 +173,9 @@ out:
>  static void destroy_fsync_dnodes(struct f2fs_sb_info *sbi,
>  					struct list_head *head)
>  {
> -	struct list_head *this;
> -	struct fsync_inode_entry *entry;
> -	list_for_each(this, head) {
> -		entry = list_entry(this, struct fsync_inode_entry, list);
> +	struct fsync_inode_entry *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, head, list) {
>  		iput(entry->inode);
>  		list_del(&entry->list);
>  		kmem_cache_free(fsync_entry_slab, entry);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
