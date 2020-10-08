From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 08 Oct 2020 18:58:52 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix return of uninitialized value in rval
Message-Id: <d9b88091-27ba-5197-6979-710bd8075350@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008183239.200358-1-colin.king@canonical.com>
 <20201008184105.GA25478@duo.ucw.cz>
In-Reply-To: <20201008184105.GA25478@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@denx.de>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/10/2020 19:41, Pavel Machek wrote:
> On Thu 2020-10-08 19:32:39, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> A previous change removed the initialization of rval and there is
>> now an error where an uninitialized rval is being returned on an
>> error return path. Fix this by returning -ENODEV.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Fixes: b994718760fa ("scsi: qla2xxx: Use constant when it is known")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Pavel Machek (CIP) <pavel@denx.de>
> 
> And sorry, I did patch against mainline, and this got added in -next
> in the meantime.

Ah, that explains it. No problem, Coverity is good at finding buglets

Colin

> 
>> index ae47e0eb0311..1f9005125313 100644
>> --- a/drivers/scsi/qla2xxx/qla_nvme.c
>> +++ b/drivers/scsi/qla2xxx/qla_nvme.c
>> @@ -561,7 +561,7 @@ static int qla_nvme_post_cmd(struct nvme_fc_local_port *lport,
>>  	vha = fcport->vha;
>>  
>>  	if (!(fcport->nvme_flag & NVME_FLAG_REGISTERED))
>> -		return rval;
>> +		return -ENODEV;
>>  
>>  	if (test_bit(ABORT_ISP_ACTIVE, &vha->dpc_flags) ||
>>  	    (qpair && !qpair->fw_started) || fcport->deleted)
>> -- 
>> 2.27.0
>>
> 
