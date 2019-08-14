From: maowenan <maowenan@huawei.com>
Date: Wed, 14 Aug 2019 02:40:14 +0000
Subject: Re: [PATCH linux-next] drivers: dma: Fix sparse warning for mux_configure32
Message-Id: <0a29e584-2385-9e7c-8d13-3ba47d3bf81c@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190812074205.96759-1-maowenan@huawei.com>
 <20190813044327.GR12733@vkoul-mobl.Dlink>
In-Reply-To: <20190813044327.GR12733@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/8/13 12:43, Vinod Koul wrote:
> On 12-08-19, 15:42, Mao Wenan wrote:
> 
> Patch title is incorrect, it should mention the changes in patch, for
> example make mux_configure32 static
> 
> Do read up on Documentation/process/submitting-patches.rst again!
> 
>> There is one sparse warning in drivers/dma/fsl-edma-common.c,
> 
> It will help to explain the warning before the fix
> 
>> fix it by setting mux_configure32() as static.
>>
>> make allmodconfig ARCH=mips CROSS_COMPILE=mips-linux-gnu-
>> make C=2 drivers/dma/fsl-edma-common.o ARCH=mips CROSS_COMPILE=mips-linux-gnu-
> 
> Make cmds are not relevant for the log
> 
>> drivers/dma/fsl-edma-common.c:93:6: warning: symbol 'mux_configure32' was not declared. Should it be static?
> 
> This one is and should be retained
> 
>>
>> Fixes: 232a7f18cf8ec ("dmaengine: fsl-edma: add i.mx7ulp edma2 version support")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  drivers/dma/fsl-edma-common.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
>> index 6d6d8a4..7dbf7df 100644
>> --- a/drivers/dma/fsl-edma-common.c
>> +++ b/drivers/dma/fsl-edma-common.c
>> @@ -90,8 +90,8 @@ static void mux_configure8(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
>>  	iowrite8(val8, addr + off);
>>  }
>>  
>> -void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
>> -		     u32 off, u32 slot, bool enable)
>> +static void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
> 
> just change this to static
> 
>> +			    u32 off, u32 slot, bool enable)
> 
> and dont change anything else.
> 
> If you feel to change this, propose a new patch for this line explaining
> why this should be changed

thanks, I will send v2.

> 
>>  {
>>  	u32 val;
>>  
>> -- 
>> 2.7.4
> 
