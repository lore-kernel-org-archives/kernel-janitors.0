From: John Garry <john.garry@huawei.com>
Date: Mon, 21 Nov 2016 14:16:55 +0000
Subject: Re: [PATCH] scsi: hisi_sas: Add a missing call to kfree
Message-Id: <aed62bfb-f26a-78de-8d8e-2b186b07d21f@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161119174259.20344-1-lambert.quentin@gmail.com>
 <e1e060ba-a231-b4f3-4a41-f9fac9ca2d54@huawei.com>
 <0edd4edf-f7c8-053d-7eba-724757dc7d43@gmail.com>
In-Reply-To: <0edd4edf-f7c8-053d-7eba-724757dc7d43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 21/11/2016 13:20, Quentin Lambert wrote:
>
>
> On 11/21/2016 01:53 PM, John Garry wrote:
>> However I have noticed that we should do a call to hisi_sas_free() for
>> this failure, and later failures in the probe.
> I don't understand why, and would welcome the opportunity to learn
> something.
>

We call hisi_sas_alloc() from hisi_sas_shost_alloc(); if we fail after 
this in hisi_sas_probe(), then we should free the memmories and 
workqueue got in hisi_sas_alloc(), which we don't.

Thanks,
John

> Quentin
>
>
>


