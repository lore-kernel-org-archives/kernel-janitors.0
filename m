From: =?UTF-8?Q?=c3=89ric_Piel?= <eric.piel@tremplin-utc.net>
Date: Tue, 09 Jan 2018 08:11:51 +0000
Subject: Re: [PATCH] misc/lis3lv02d: Delete an error message for a failed memory allocation in lis3lv02d_init
Message-Id: <6f1bcb25-b2bd-da30-5e9c-60340ceffed7@tremplin-utc.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c71380d4-50f4-3d8f-8c7f-4df5a0098402@users.sourceforge.net>
In-Reply-To: <c71380d4-50f4-3d8f-8c7f-4df5a0098402@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

On 08/01/18 22:33, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 Jan 2018 22:26:06 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Thanks, looks fine.

Signed-off-by: Éric Piel <eric.piel@tremplin-utc.net>

Maybe the "Kernel Janitors" can just pick it up?

Cheers,
Éric

> ---
>   drivers/misc/lis3lv02d/lis3lv02d.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
> index e49888eab87d..ba2bd49c15fa 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d.c
> +++ b/drivers/misc/lis3lv02d/lis3lv02d.c
> @@ -1172,11 +1172,8 @@ int lis3lv02d_init_device(struct lis3lv02d *lis3)
>   
>   	lis3->reg_cache = kzalloc(max(sizeof(lis3_wai8_regs),
>   				     sizeof(lis3_wai12_regs)), GFP_KERNEL);
> -
> -	if (lis3->reg_cache = NULL) {
> -		printk(KERN_ERR DRIVER_NAME "out of memory\n");
> +	if (!lis3->reg_cache)
>   		return -ENOMEM;
> -	}
>   
>   	mutex_init(&lis3->mutex);
>   	atomic_set(&lis3->wake_thread, 0);
> 

