From: Zheng Liu <gnehzuil.liu@gmail.com>
Date: Thu, 20 Jun 2013 15:21:58 +0000
Subject: Re: [patch] ext4: signedness bug breaks ext4_inode_touch_time_cmp()
Message-Id: <20130620152158.GA20615@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130620080858.GA15095@elgon.mountain>
In-Reply-To: <20130620080858.GA15095@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Zheng Liu <wenqing.lz@taobao.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 20, 2013 at 11:08:58AM +0300, Dan Carpenter wrote:
> "diff" is unsigned so this doesn't sort the LRU list correctly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for fixing it.

Regards,
                                                - Zheng

> ---
> This was introduced in 6480bad916be "ext4: improve extent cache shrink
> mechanism to avoid to burn CPU time"
> 
> diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> index e0190f6..79e097d 100644
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@ -880,7 +880,7 @@ static int ext4_inode_touch_time_cmp(void *priv, struct list_head *a,
>  				     struct list_head *b)
>  {
>  	struct ext4_inode_info *eia, *eib;
> -	unsigned long diff;
> +	long diff;
>  
>  	eia = list_entry(a, struct ext4_inode_info, i_es_lru);
>  	eib = list_entry(b, struct ext4_inode_info, i_es_lru);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ext4" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
