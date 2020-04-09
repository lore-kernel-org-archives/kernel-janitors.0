From: Jason Wang <jasowang@redhat.com>
Date: Thu, 09 Apr 2020 03:19:20 +0000
Subject: Re: [PATCH] virtio-mmio: Delete an error message in vm_find_vqs()
Message-Id: <03b19e72-0021-dc6b-77c4-ed3c4e13d526@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9e27bc4a-cfa1-7818-dc25-8ad308816b30@web.de>
In-Reply-To: <9e27bc4a-cfa1-7818-dc25-8ad308816b30@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>


On 2020/4/6 上午1:19, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 19:14:10 +0200
>
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.


It looks to me that not all error path of platform_get_irq() were loggd.

And git grep told me there're other users of platform_get_irq() that 
check and log by themselves.

Thanks


>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/virtio/virtio_mmio.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 97d5725fd9a2..9d16aaffca9d 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -466,10 +466,8 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   	int irq = platform_get_irq(vm_dev->pdev, 0);
>   	int i, err, queue_idx = 0;
>
> -	if (irq < 0) {
> -		dev_err(&vdev->dev, "Cannot get IRQ resource\n");
> +	if (irq < 0)
>   		return irq;
> -	}
>
>   	err = request_irq(irq, vm_interrupt, IRQF_SHARED,
>   			dev_name(&vdev->dev), vm_dev);
> --
> 2.26.0
>
