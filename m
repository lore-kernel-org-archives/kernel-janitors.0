From: Jan Kara <jack@suse.cz>
Date: Mon, 26 Nov 2018 13:56:32 +0000
Subject: Re: [PATCH] jbd2: clean up indentation issue, replace spaces with tab
Message-Id: <20181126135632.GA25835@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123164053.19193-1-colin.king@canonical.com>
In-Reply-To: <20181123164053.19193-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri 23-11-18 16:40:53, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented with spaces, replace it with
> a tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/jbd2/transaction.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
> index c0b66a7a795b..4af8ff17ad5c 100644
> --- a/fs/jbd2/transaction.c
> +++ b/fs/jbd2/transaction.c
> @@ -910,7 +910,7 @@ do_get_write_access(handle_t *handle, struct journal_head *jh,
>  	 * this is the first time this transaction is touching this buffer,
>  	 * reset the modified flag
>  	 */
> -       jh->b_modified = 0;
> +	jh->b_modified = 0;
>  
>  	/*
>  	 * If the buffer is not journaled right now, we need to make sure it
> -- 
> 2.19.1
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
