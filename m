From: Jan Kara <jack@suse.cz>
Date: Tue, 25 Feb 2014 09:49:29 +0000
Subject: Re: [patch] ext3: remove an unneeded check in ext3_new_blocks()
Message-Id: <20140225094929.GA1669@quack.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140225083945.GC5023@elgon.mountain>
In-Reply-To: <20140225083945.GC5023@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue 25-02-14 11:39:45, Dan Carpenter wrote:
> We know "fatal" is zero here.  The code can be simplified a bit by
> assigning directly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
  Thanks. Added to my tree.

								Honza

> 
> diff --git a/fs/ext3/balloc.c b/fs/ext3/balloc.c
> index 22548f56197b..158b5d4ce067 100644
> --- a/fs/ext3/balloc.c
> +++ b/fs/ext3/balloc.c
> @@ -1727,10 +1727,7 @@ allocated:
>  	percpu_counter_sub(&sbi->s_freeblocks_counter, num);
>  
>  	BUFFER_TRACE(gdp_bh, "journal_dirty_metadata for group descriptor");
> -	err = ext3_journal_dirty_metadata(handle, gdp_bh);
> -	if (!fatal)
> -		fatal = err;
> -
> +	fatal = ext3_journal_dirty_metadata(handle, gdp_bh);
>  	if (fatal)
>  		goto out;
>  
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
