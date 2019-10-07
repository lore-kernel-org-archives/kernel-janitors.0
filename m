From: Fabrice Gasnier <fabrice.gasnier@st.com>
Date: Mon, 07 Oct 2019 07:31:10 +0000
Subject: Re: [PATCH] counter: stm32: clean up indentation issue
Message-Id: <792dd11a-ae78-c4a3-834f-b1f67a750a14@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925095126.20219-1-colin.king@canonical.com>
 <20191005173004.GA7431@icarus>
In-Reply-To: <20191005173004.GA7431@icarus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Colin King <colin.king@canonical.com>, linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>

On 10/5/19 7:30 PM, William Breathitt Gray wrote:
> On Wed, Sep 25, 2019 at 10:51:26AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is an if statement that is indented one level too deeply,
>> remove the extraneous tabs.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/counter/stm32-timer-cnt.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
>> index 644ba18a72ad..613dcccf79e1 100644
>> --- a/drivers/counter/stm32-timer-cnt.c
>> +++ b/drivers/counter/stm32-timer-cnt.c
>> @@ -219,8 +219,8 @@ static ssize_t stm32_count_enable_write(struct counter_device *counter,
>>  
>>  	if (enable) {
>>  		regmap_read(priv->regmap, TIM_CR1, &cr1);
>> -			if (!(cr1 & TIM_CR1_CEN))
>> -				clk_enable(priv->clk);
>> +		if (!(cr1 & TIM_CR1_CEN))
>> +			clk_enable(priv->clk);
>>  
>>  		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>>  				   TIM_CR1_CEN);
>> -- 
>> 2.20.1
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> 
> Fabrice,
> 
> I noticed the TIM_CR1_CEN check is happening before the
> regmap_update_bits call for the enable path, while the disable path does
> the check after. Is this logic is correct.

Hi  William,

In the disable path, things are done in the reverse order, purpose is to:
- enable the clock before enabling the counter (CEN)
- disable the clock after the counter has been disabled
Current code also takes care of balancing clock enable/disable calls.

BR,
Fabrice
> 
> William Breathitt Gray
> 
