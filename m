From: Scott Branden <scott.branden@broadcom.com>
Date: Mon, 01 Feb 2021 17:31:17 +0000
Subject: Re: [PATCH] misc: bcm-vk: unlock on error in bcm_to_h_msg_dequeue()
Message-Id: <cf899c97-2c26-afc4-f0ea-4976a074a05e@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBfyb+jU5lDUe+5g@mwanda>
In-Reply-To: <YBfyb+jU5lDUe+5g@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Desmond Yan <desmond.yan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2021-02-01 4:22 a.m., Dan Carpenter wrote:
> Unlock before returning on this error path.
>
> Fixes: 111d746bb476 ("misc: bcm-vk: add VK messaging support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/misc/bcm-vk/bcm_vk_msg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_msg.c
> index eec90494777d..fc972e43258a 100644
> --- a/drivers/misc/bcm-vk/bcm_vk_msg.c
> +++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
> @@ -849,7 +849,8 @@ s32 bcm_to_h_msg_dequeue(struct bcm_vk *vk)
>  				 * that is fatal.
>  				 */
>  				dev_crit(dev, "Kernel mem allocation failure.\n");
> -				return -ENOMEM;
> +				total = -ENOMEM;
> +				goto idx_err;
>  			}
>  
This is a pretty fatal case if we fail to allocate memory here.
Will let Desmond respond if we wanted to keep the mutex locked forever in this
case or if we do want to return and keep mutex locked if it is fatal and there is
no real recovery path.
>  			/* flush rd pointer after a message is dequeued */
