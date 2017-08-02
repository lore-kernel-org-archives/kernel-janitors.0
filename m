From: Xiubo Li <lixiubo@cmss.chinamobile.com>
Date: Wed, 02 Aug 2017 03:25:35 +0000
Subject: Re: [PATCH] tcmu: Oops in unmap_thread_fn()
Message-Id: <28f668c4-2a61-8685-8797-8ae7470cb274@cmss.chinamobile.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170801200917.brigs5x47eujfx7a@mwanda>
In-Reply-To: <20170801200917.brigs5x47eujfx7a@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 2017年08月02日 04:09, Dan Carpenter wrote:
> Calling list_del() on the iterator pointer in list_for_each_entry() will
> cause an oops.  We need to user the _safe() version for that.
>
> Fixes: c73d02f63c16 ("tcmu: Add fifo type waiter list support to avoid starvation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
> index 9258b7dd2c30..fd9fcea68d23 100644
> --- a/drivers/target/target_core_user.c
> +++ b/drivers/target/target_core_user.c
> @@ -1985,7 +1985,7 @@ static struct target_backend_ops tcmu_ops = {
>   
>   static int unmap_thread_fn(void *data)
>   {
> -	struct tcmu_dev *udev;
> +	struct tcmu_dev *udev, *tmp;
>   	loff_t off;
>   	uint32_t start, end, block;
>   	static uint32_t free_blocks;
> @@ -2056,7 +2056,7 @@ static int unmap_thread_fn(void *data)
>   		 * for the global data pool blocks.
>   		 */
>   		mutex_lock(&root_udev_waiter_mutex);
> -		list_for_each_entry(udev, &root_udev_waiter, waiter) {
> +		list_for_each_entry_safe(udev, tmp, &root_udev_waiter, waiter) {
>   			mutex_lock(&udev->cmdr_lock);
>   			if (udev->waiting_blocks < free_blocks) {
>   				mutex_unlock(&udev->cmdr_lock);
Good catch and it looks nice for me.

Thanks,

BRs
Xiubo


