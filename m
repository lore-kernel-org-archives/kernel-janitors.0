From: "Milan P. Gandhi" <mgandhi@redhat.com>
Date: Fri, 12 Feb 2021 04:22:06 +0000
Subject: Re: [PATCH v2] scsi: qla2xxx: Removed extra space in variable declaration.
Message-Id: <9da0412a-6bf0-1f09-85af-2aec025ee3ec@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210211131628.GA10754@machine1>
 <ccf393f7-cbfc-fb8c-6f73-bb502eaa54f3@acm.org>
 <b44bd29e-389c-634f-333d-edc88b3d7be9@oracle.com>
In-Reply-To: <b44bd29e-389c-634f-333d-edc88b3d7be9@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Himanshu Madhani <himanshu.madhani@oracle.com>, Bart Van Assche <bvanassche@acm.org>, kernel-janitors@vger.kernel.org
Cc: GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org, njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com

Hi Bart, Himanshu,

On 2/11/21 10:18 PM, Himanshu Madhani wrote:
> Hi Milan,
> 
> On 2/11/21 9:57 AM, Bart Van Assche wrote:
>> On 2/11/21 5:16 AM, Milan P. Gandhi wrote:
>>> Removed extra space in variable declaration in qla2x00_sysfs_write_nvram
>>>
>>> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
>>> ---
>>> changes v2:
>>>   - Added a small note about change.
>>> ---
>>> diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
>>> index ab45ac1e5a72..7f2db8badb6d 100644
>>> --- a/drivers/scsi/qla2xxx/qla_attr.c
>>> +++ b/drivers/scsi/qla2xxx/qla_attr.c
>>> @@ -226,7 +226,7 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
>>>       struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
>>>           struct device, kobj)));
>>>       struct qla_hw_data *ha = vha->hw;
>>> -    uint16_t    cnt;
>>> +    uint16_t cnt;
>>>         if (!capable(CAP_SYS_ADMIN) || off != 0 || count != ha->nvram_size ||
>>>           !ha->isp_ops->write_nvram)
>>
>> I'm not sure if such a patch is considered substantial enough to be
>> included upstream.
>>
>> For future patches, please follow the guidelines for submitting patches
>> and use the imperative mood for the subject (Removed -> Remove) and do
>> not end the patch subject with a dot. See also
>> Documentation/process/submitting-patches.rst
>>
>> Bart.
>>
>>
> Agree with Bart here.
> 
> What was motivation behind this patch?
> 
> if you scroll through code, i am pretty sure you will find more than one place where spaces are not consistent (especially 15+ yr old code).
> 
I thought it was a typo and extra space was left, so just fixed it.
But it looks that there are many other places in qla2xxx source with similar declarations.
I apologize for the noise.

Thanks,
Milan.
