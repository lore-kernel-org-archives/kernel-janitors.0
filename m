From: Max Gurtovoy <maxg@mellanox.com>
Date: Tue, 26 Feb 2019 10:24:56 +0000
Subject: Re: [PATCH] IB/iser: Fix some error handling in iser_fast_reg_fmr()
Message-Id: <f7c748b7-f1bf-6e11-252c-b1b3254f5b9d@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220054041.GB25196@kadam>
In-Reply-To: <20190220054041.GB25196@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org


On 2/25/2019 11:27 PM, Sagi Grimberg wrote:
>
>> but the below fix is the correct one for future code as well 
>> (ib_dma_map_sg returns int and not unsigned int):
>>
>> diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.h 
>> b/drivers/infiniband/ulp/iser/iscsi_iser.h
>> index 0bf8512..def8cfe 100644
>> --- a/drivers/infiniband/ulp/iser/iscsi_iser.h
>> +++ b/drivers/infiniband/ulp/iser/iscsi_iser.h
>> @@ -205,7 +205,7 @@ struct iser_data_buf {
>>      struct scatterlist *sg;
>>      int                size;
>>      unsigned long      data_len;
>> -   unsigned int       dma_nents;
>> +   int                dma_nents;
>>   };
>>
>>
>> thoughts ?
>
> That's fine as well, care to send a patch?


Done, please see it in the mailing list.
