From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 07 Jul 2020 11:38:25 +0000
Subject: Re: [PATCH] scsi: fcoe: add missed kfree() in an error path
Message-Id: <977e2781-99ed-54c0-27ad-82d768a1c1e6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, "James E. J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Neerav Parikh <Neerav.Parikh@intel.com>, Robert Love <robert.w.love@intel.com>

> fcoe_fdmi_info() misses to call kfree() in an error path.
> Add the missed function call to fix it.

I suggest to use an additional jump target for the completion
of the desired exception handling.


=E2=80=A6
> +++ b/drivers/scsi/fcoe/fcoe.c
> @@ -830,6 +830,7 @@ static void fcoe_fdmi_info(struct fc_lport *lport, st=
ruct net_device *netdev)
>  		if (rc) {
>  			printk(KERN_INFO "fcoe: Failed to retrieve FDMI "
>  					"information from netdev.\n");
> +			kfree(fdmi);
>  			return;
>  		}

-			return;
+			goto free_fdmi;


How do you think about to apply any further coding style adjustments?

Regards,
Markus
