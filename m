From: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Fri, 11 Jan 2019 02:12:26 +0000
Subject: Re: [PATCH] powerpc/powernv/npu: Allocate enough memory in pnv_try_setup_npu_table_group()
Message-Id: <1cc5d61d-1060-8c5c-4229-59b9410efd7f@ozlabs.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109102328.GB5476@kadam>
 <87wonerqq2.fsf@concordia.ellerman.id.au>
In-Reply-To: <87wonerqq2.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>, Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Alistair Popple <alistair@popple.id.au>, Mark Hairgrove <mhairgrove@nvidia.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org



On 09/01/2019 22:54, Michael Ellerman wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> There is a typo so we accidentally allocate enough memory for a pointer
>> when we wanted to allocate enough for a struct.
>>
>> Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  arch/powerpc/platforms/powernv/npu-dma.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thanks, I've applied this to my fixes-test tree.
> 
> Alexey can you send me an ack?


Ouch.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> 
> cheers
> 
>> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
>> index d7f742ed48ba..3f58c7dbd581 100644
>> --- a/arch/powerpc/platforms/powernv/npu-dma.c
>> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
>> @@ -564,7 +564,7 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>>  		}
>>  	} else {
>>  		/* Create a group for 1 GPU and attached NPUs for POWER8 */
>> -		pe->npucomp = kzalloc(sizeof(pe->npucomp), GFP_KERNEL);
>> +		pe->npucomp = kzalloc(sizeof(*pe->npucomp), GFP_KERNEL);
>>  		table_group = &pe->npucomp->table_group;
>>  		table_group->ops = &pnv_npu_peers_ops;
>>  		iommu_register_group(table_group, hose->global_number,
>> -- 
>> 2.17.1

-- 
Alexey
