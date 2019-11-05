From: Sumit Saxena <sumit.saxena@broadcom.com>
Date: Tue, 05 Nov 2019 09:40:35 +0000
Subject: Re: [PATCH] scsi: megaraid_sas: Use common error handling code in megasas_mgmt_ioctl_fw()
Message-Id: <CAL2rwxrdOVeO3RT_Y3mk3p-076eMMWm6VVF0C4yiYEWJ0TO5DQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d5c12f05-5a07-b698-ae60-2728330dd378@web.de>
In-Reply-To: <d5c12f05-5a07-b698-ae60-2728330dd378@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Linux SCSI List <linux-scsi@vger.kernel.org>, "PDL,MEGARAIDLINUX" <megaraidlinux.pdl@broadcom.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Chandrakanth Patil <chandrakanth.patil@broadcom.com>, YueHaibing <yuehaibing@huawei.com>

On Fri, Nov 1, 2019 at 3:06 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 31 Oct 2019 22:23:02 +0100
>
> Move the same error code assignments so that such exception handling
> can be better reused at the end of this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Sumit Saxena <sumit.saxena@broadcom.com>

> ---
>  drivers/scsi/megaraid/megaraid_sas_base.c | 25 ++++++++++-------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> index c40fbea06cc5..f2f2a240e5af 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> @@ -8272,27 +8272,20 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
>                 return PTR_ERR(ioc);
>
>         instance = megasas_lookup_instance(ioc->host_no);
> -       if (!instance) {
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> -       }
> +       if (!instance)
> +               goto e_nodev;
>
>         /* Block ioctls in VF mode */
> -       if (instance->requestorId && !allow_vf_ioctls) {
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> -       }
> +       if (instance->requestorId && !allow_vf_ioctls)
> +               goto e_nodev;
>
>         if (atomic_read(&instance->adprecovery) = MEGASAS_HW_CRITICAL_ERROR) {
>                 dev_err(&instance->pdev->dev, "Controller in crit error\n");
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> +               goto e_nodev;
>         }
>
> -       if (instance->unload = 1) {
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> -       }
> +       if (instance->unload = 1)
> +               goto e_nodev;
>
>         if (down_interruptible(&instance->ioctl_sem)) {
>                 error = -ERESTARTSYS;
> @@ -8311,6 +8304,10 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
>  out_kfree_ioc:
>         kfree(ioc);
>         return error;
> +
> +e_nodev:
> +       error = -ENODEV;
> +       goto out_kfree_ioc;
>  }
>
>  static int megasas_mgmt_ioctl_aen(struct file *file, unsigned long arg)
> --
> 2.23.0
>
