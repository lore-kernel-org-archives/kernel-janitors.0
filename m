From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Jul 2020 07:22:34 +0000
Subject: Re: [PATCH] scsi: fcoe: add missed kfree() in an error path
Message-Id: <ec1e1405-7582-0709-f2a5-a8b91e45fa1a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <977e2781-99ed-54c0-27ad-82d768a1c1e6@web.de>
 <5F067CDA.8010404@huawei.com>
In-Reply-To: <5F067CDA.8010404@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, "James E. J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Neerav Parikh <Neerav.Parikh@intel.com>

>>> fcoe_fdmi_info() misses to call kfree() in an error path.
>>> Add the missed function call to fix it.
>>
>> I suggest to use an additional jump target for the completion
>> of the desired exception handling.
>>
>>
>> …
>>> +++ b/drivers/scsi/fcoe/fcoe.c
>>> @@ -830,6 +830,7 @@ static void fcoe_fdmi_info(struct fc_lport *lport, struct net_device *netdev)
>>>           if (rc) {
>>>               printk(KERN_INFO "fcoe: Failed to retrieve FDMI "
>>>                       "information from netdev.\n");
>>> +            kfree(fdmi);
>>>               return;
>>>           }
>>
>> -            return;
>> +            goto free_fdmi;
>>
>>
>> How do you think about to apply any further coding style adjustments?
>
> The local variable "fdmi" is invisible to the function.

I have got understanding difficulties for this information.
The function call “kfree(fdmi)” is already used at the end of this if branch.
Thus I propose to add a label there.

Do you notice any additional improvement possibilities for this software module?

Regards,
Markus
