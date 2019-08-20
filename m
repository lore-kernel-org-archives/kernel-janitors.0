From: maowenan <maowenan@huawei.com>
Date: Tue, 20 Aug 2019 11:48:48 +0000
Subject: Re: [PATCH v2 linux-next 0/2] change mux_configure32() to static
Message-Id: <bdd606cb-535f-c153-d51f-4571db2d23dc@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814072105.144107-1-maowenan@huawei.com>
 <20190820114105.GW12733@vkoul-mobl.Dlink>
In-Reply-To: <20190820114105.GW12733@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/8/20 19:41, Vinod Koul wrote:
> On 14-08-19, 15:21, Mao Wenan wrote:
>> First patch is to make mux_configure32() static to avoid sparse warning,
>> the second patch is to chage alignment of two functions.
> 
> The subsystem name is "dmaengine" please use that in future, I have
> fixed that and applied

Okay, thanks.

> 
>> v2: change subject from "drivers: dma: Fix sparse warning for mux_configure32"
>> to "drivers: dma: make mux_configure32 static", and cleanup the log. And add 
>> one patch to change alignment of two functions. 
>>
>> Mao Wenan (2):
>>   drivers: dma: make mux_configure32 static
>>   drivers: dma: change alignment of mux_configure32 and
>>     fsl_edma_chan_mux
>>
>>  drivers/dma/fsl-edma-common.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.20.1
> 
