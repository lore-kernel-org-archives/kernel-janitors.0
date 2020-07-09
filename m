From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Thu, 09 Jul 2020 02:11:38 +0000
Subject: Re: [PATCH] scsi: fcoe: add missed kfree() in an error path
Message-Id: <5F067CDA.8010404@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <977e2781-99ed-54c0-27ad-82d768a1c1e6@web.de>
In-Reply-To: <977e2781-99ed-54c0-27ad-82d768a1c1e6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, "James E. J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Neerav Parikh <Neerav.Parikh@intel.com>, Robert Love <robert.w.love@intel.com>



On 2020/7/7 19:38, Markus Elfring wrote:
>> fcoe_fdmi_info() misses to call kfree() in an error path.
>> Add the missed function call to fix it.
>
> I suggest to use an additional jump target for the completion
> of the desired exception handling.
>
>
> =E2=80=A6
>> +++ b/drivers/scsi/fcoe/fcoe.c
>> @@ -830,6 +830,7 @@ static void fcoe_fdmi_info(struct fc_lport *lport, s=
truct net_device *netdev)
>>   		if (rc) {
>>   			printk(KERN_INFO "fcoe: Failed to retrieve FDMI "
>>   					"information from netdev.\n");
>> +			kfree(fdmi);
>>   			return;
>>   		}
>
> -			return;
> +			goto free_fdmi;
>
>
> How do you think about to apply any further coding style adjustments?

The local variable "fdmi" is invisible to the function.
See fcoe_fdmi_info().

	Thanks
>
> Regards,
> Markus
> .
>
