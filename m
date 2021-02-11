From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 11 Feb 2021 09:41:14 +0000
Subject: Re: [PATCH][next] soc: xilinx: vcu: remove deadcode on null divider check
Message-Id: <8c01414b-fba3-f22d-152f-bfb7d76f9d00@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210184938.146124-1-colin.king@canonical.com>
 <20210211073156.GB30300@pengutronix.de>
In-Reply-To: <20210211073156.GB30300@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 11/02/2021 07:31, Michael Tretter wrote:
> On Wed, 10 Feb 2021 18:49:38 +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The pointer 'divider' has previously been null checked followed by
>> a return, hence the subsequent null check is redundant deadcode
>> that can be removed.  Clean up the code and remove it.
>>
>> Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/clk/xilinx/xlnx_vcu.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
>> index d66b1315114e..607936d7a413 100644
>> --- a/drivers/clk/xilinx/xlnx_vcu.c
>> +++ b/drivers/clk/xilinx/xlnx_vcu.c
>> @@ -512,9 +512,6 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
>>  
>>  	mux = clk_hw_get_parent(divider);
>>  	clk_hw_unregister_mux(mux);
>> -	if (!divider)
>> -		return;
>> -
>>  	clk_hw_unregister_divider(divider);
> 
> Thanks for pointing this out. There is actually a different bug there.
> 
> There should have been a check for !mux before unregistering the mux:
> 
> 	mux = clk_hw_get_parent(divider);
> 	clk_hw_unregister_divider(divider);
> 	if (!mux)
> 		return;

Ah, that makes sense, I'll send a V2.

> 
> 	clk_hw_unregister_mux(mux);
> 
> Michael
> 
>>  }
>>  
>> -- 
>> 2.30.0
>>
>>
