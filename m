From: Coly Li <colyli@suse.de>
Date: Sat, 22 Dec 2018 13:03:43 +0000
Subject: Re: [PATCH] bcache: fix indentation issue, remove tabs on a hunk of code
Message-Id: <4d3bdea3-d155-b116-f09f-ad5a0b00718a@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221231812.16086-1-colin.king@canonical.com>
In-Reply-To: <20181221231812.16086-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Kent Overstreet <kent.overstreet@gmail.com>, linux-bcache@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/22/18 7:18 上午, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a hunk of code that is indented one level too deep, fix this
> by removing the extra tabs.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Hi Colin,

Nice catch, thank you! I will add it into my for-next directory.

Coly Li

> ---
>  drivers/md/bcache/super.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 4dee119c3664..a697a3a923cd 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1615,21 +1615,21 @@ static void conditional_stop_bcache_device(struct cache_set *c,
>  		 */
>  		pr_warn("stop_when_cache_set_failed of %s is \"auto\" and cache is dirty, stop it to avoid potential data corruption.",
>  			d->disk->disk_name);
> -			/*
> -			 * There might be a small time gap that cache set is
> -			 * released but bcache device is not. Inside this time
> -			 * gap, regular I/O requests will directly go into
> -			 * backing device as no cache set attached to. This
> -			 * behavior may also introduce potential inconsistence
> -			 * data in writeback mode while cache is dirty.
> -			 * Therefore before calling bcache_device_stop() due
> -			 * to a broken cache device, dc->io_disable should be
> -			 * explicitly set to true.
> -			 */
> -			dc->io_disable = true;
> -			/* make others know io_disable is true earlier */
> -			smp_mb();
> -			bcache_device_stop(d);
> +		/*
> +		 * There might be a small time gap that cache set is
> +		 * released but bcache device is not. Inside this time
> +		 * gap, regular I/O requests will directly go into
> +		 * backing device as no cache set attached to. This
> +		 * behavior may also introduce potential inconsistence
> +		 * data in writeback mode while cache is dirty.
> +		 * Therefore before calling bcache_device_stop() due
> +		 * to a broken cache device, dc->io_disable should be
> +		 * explicitly set to true.
> +		 */
> +		dc->io_disable = true;
> +		/* make others know io_disable is true earlier */
> +		smp_mb();
> +		bcache_device_stop(d);
>  	} else {
>  		/*
>  		 * dc->stop_when_cache_set_failed = BCH_CACHED_STOP_AUTO
> 
