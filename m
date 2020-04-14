From: Wei Liu <wei.liu@kernel.org>
Date: Tue, 14 Apr 2020 20:24:12 +0000
Subject: Re: [PATCH][next] drivers: hv: remove redundant assignment to pointer primary_channel
Message-Id: <20200414202412.op5kxcqc7k4bce6z@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200414152343.243166-1-colin.king@canonical.com>
In-Reply-To: <20200414152343.243166-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 14, 2020 at 04:23:43PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer primary_channel is being assigned with a value that is never,
> The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks.

Now that the only user of primary_channel is within the else branch, we
can go one step further to move the definition of primary_channel there.

I can make the adjustment while committing this patch, as well as
updating the commit message.

Wei.

> ---
>  drivers/hv/channel_mgmt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
> index ffd7fffa5f83..f7bbb8dc4b0f 100644
> --- a/drivers/hv/channel_mgmt.c
> +++ b/drivers/hv/channel_mgmt.c
> @@ -425,8 +425,6 @@ void hv_process_channel_removal(struct vmbus_channel *channel)
>  
>  	if (channel->primary_channel = NULL) {
>  		list_del(&channel->listentry);
> -
> -		primary_channel = channel;
>  	} else {
>  		primary_channel = channel->primary_channel;
>  		spin_lock_irqsave(&primary_channel->lock, flags);
> -- 
> 2.25.1
> 
