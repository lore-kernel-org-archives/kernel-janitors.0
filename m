From: Joseph Qi <joseph.qi@linux.alibaba.com>
Date: Tue, 02 Feb 2021 01:48:11 +0000
Subject: Re: [PATCH] ocfs2: Fix a use after free on error
Message-Id: <2809e2b1-fcb4-bd91-d855-9812ede19447@linux.alibaba.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBfzR7AbZZ4Pp6sq@mwanda>
In-Reply-To: <YBfzR7AbZZ4Pp6sq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mark Fasheh <mark@fasheh.com>, Jiri Slaby <jirislaby@kernel.org>
Cc: Joel Becker <jlbec@evilplan.org>, Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alex.shi@linux.alibaba.com>, Jens Axboe <axboe@kernel.dk>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2/1/21 8:25 PM, Dan Carpenter wrote:
> The error handling in this function frees "reg" but it is still on the
> "o2hb_all_regions" list so it will lead to a use after free.  The fix
> for this is to only add it to the list after everything has succeeded.
> 
Seems we have to clear the bitmap as well in error case.
So how about add a new error label and handle them both?

Thanks,
Joseph

> Fixes: 1cf257f51191 ("ocfs2: fix memory leak")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis and hasn't been tested.
> 
>  fs/ocfs2/cluster/heartbeat.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 0179a73a3fa2..92af4dc813e7 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -2025,7 +2025,6 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
>  		}
>  		set_bit(reg->hr_region_num, o2hb_region_bitmap);
>  	}
> -	list_add_tail(&reg->hr_all_item, &o2hb_all_regions);
>  	spin_unlock(&o2hb_live_lock);
>  
>  	config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type);
> @@ -2053,6 +2052,10 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
>  
>  	o2hb_debug_region_init(reg, o2hb_debug_dir);
>  
> +	spin_lock(&o2hb_live_lock);
> +	list_add_tail(&reg->hr_all_item, &o2hb_all_regions);
> +	spin_unlock(&o2hb_live_lock);
> +
>  	return &reg->hr_item;
>  
>  unregister_handler:
> 
