From: Joseph Qi <joseph.qi@linux.alibaba.com>
Date: Tue, 02 Feb 2021 12:08:28 +0000
Subject: Re: [PATCH v2] ocfs2: Fix a use after free on error
Message-Id: <56634c6b-1c68-83dc-e372-09fd4bda3c7d@linux.alibaba.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBk4M6HUG8jB/jc7@mwanda>
In-Reply-To: <YBk4M6HUG8jB/jc7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>, Andrew Morton <akpm@linux-foundation.org>, Takashi Iwai <tiwai@suse.de>, Jens Axboe <axboe@kernel.dk>, Alex Shi <alex.shi@linux.alibaba.com>, Jiri Slaby <jirislaby@kernel.org>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2/2/21 7:32 PM, Dan Carpenter wrote:
> The error handling in this function frees "reg" but it is still on the
> "o2hb_all_regions" list so it will lead to a use after freew.  Joseph Qi
> points out that we need to clear the bit in the "o2hb_region_bitmap" as
> well
> 
> Fixes: 1cf257f51191 ("ocfs2: fix memory leak")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>

> ---
> v2: The first version didn't clear the bit.
> 
>  fs/ocfs2/cluster/heartbeat.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 0179a73a3fa2..12a7590601dd 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -2042,7 +2042,7 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
>  			o2hb_nego_timeout_handler,
>  			reg, NULL, &reg->hr_handler_list);
>  	if (ret)
> -		goto free;
> +		goto remove_item;
>  
>  	ret = o2net_register_handler(O2HB_NEGO_APPROVE_MSG, reg->hr_key,
>  			sizeof(struct o2hb_nego_msg),
> @@ -2057,6 +2057,12 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
>  
>  unregister_handler:
>  	o2net_unregister_handler_list(&reg->hr_handler_list);
> +remove_item:
> +	spin_lock(&o2hb_live_lock);
> +	list_del(&reg->hr_all_item);
> +	if (o2hb_global_heartbeat_active())
> +		clear_bit(reg->hr_region_num, o2hb_region_bitmap);
> +	spin_unlock(&o2hb_live_lock);
>  free:
>  	kfree(reg);
>  	return ERR_PTR(ret);
> 
