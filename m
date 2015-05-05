From: Leonardo Carreras <leocarreras89@gmail.com>
Date: Tue, 05 May 2015 11:31:40 +0000
Subject: Re: [PATCH] drivers: dma: amba-pl08x: Supress spaces in indentation
Message-Id: <CAE9EGjO-qS+i1SEV1nqLTx6s9t34g-JmBOfpmtK8RgCxRHU3gA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150505013227.GA11053@leo-Inspiron-N5110>
	<20150505085823.GR14154@mwanda>
In-Reply-To: <20150505085823.GR14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dear Dan,

On Tue, May 5, 2015 at 4:58 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Mon, May 04, 2015 at 09:32:27PM -0400, Leonardo Carreras wrote:
>> Removed checkpatch reported spaces in indentation.
>>
>> Signed-off-by: Leonardo Carreras <leocarreras89@gmail.com>
>> ---
>>  drivers/dma/amba-pl08x.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
>> index 49d396e..a76df61 100644
>> --- a/drivers/dma/amba-pl08x.c
>> +++ b/drivers/dma/amba-pl08x.c
>> @@ -474,7 +474,7 @@ static void pl08x_terminate_phy_chan(struct pl08x_driver_data *pl08x,
>>       u32 val = readl(ch->reg_config);
>>
>>       val &= ~(PL080_CONFIG_ENABLE | PL080_CONFIG_ERR_IRQ_MASK |
>> -              PL080_CONFIG_TC_IRQ_MASK);
>> +             PL080_CONFIG_TC_IRQ_MASK);
>
> Yeah, but now it doesn't line up correctly.
>
> Do it like this:
>
>         val &= ~(PL080_CONFIG_ENABLE | PL080_CONFIG_ERR_IRQ_MASK |
>                  PL080_CONFIG_TC_IRQ_MASK);
>
> In other words:
>
> [tab][space]PL080_CONFIG_TC_IRQ_MASK);
>

I will check this, but may I ask if that would be marked as an error
by checkpatch.

Regards,

Leo

> regards,
> dan carpenter
