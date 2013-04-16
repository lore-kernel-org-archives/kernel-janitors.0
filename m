From: adam radford <aradford@gmail.com>
Date: Tue, 16 Apr 2013 21:22:08 +0000
Subject: Re: [patch] [SCSI] megaraid_sas: release lock on error path
Message-Id: <CAHtARFE9ckz9-2YFwHrTZb8BFNxCSkZL_TmbL8vFvdJ__5kyDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130416074419.GA1571@elgon.mountain>
In-Reply-To: <20130416074419.GA1571@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neela Syam Kolli <megaraidlinux@lsi.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 16, 2013 at 12:44 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We should unlock here before returning.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> index 9d53540..eb2385f 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> @@ -4931,11 +4931,12 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
>                 printk(KERN_ERR "megaraid_sas: timed out while"
>                         "waiting for HBA to recover\n");
>                 error = -ENODEV;
> -               goto out_kfree_ioc;
> +               goto out_up;
>         }
>         spin_unlock_irqrestore(&instance->hba_lock, flags);
>
>         error = megasas_mgmt_fw_ioctl(instance, user_ioc, ioc);
> +      out_up:
>         up(&instance->ioctl_sem);
>
>        out_kfree_ioc:
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks Dan, this looks good.

Acked-by: Adam Radford <aradford@gmail.com>

-Adam
