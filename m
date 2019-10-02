From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 02 Oct 2019 13:28:05 +0000
Subject: Re: [PATCH] pwm: sun4i: redundant assignment to variable pval
Message-Id: <1080ef65-b089-937d-dfae-6f5484d4ed5f@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002100844.10490-1-colin.king@canonical.com>
 <20191002132506.GO22609@kadam>
In-Reply-To: <20191002132506.GO22609@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org

On 02/10/2019 14:25, Dan Carpenter wrote:
> On Wed, Oct 02, 2019 at 11:08:44AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Variable pval is being assigned a value that is never read. The
>> assignment is redundant and hence can be removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/pwm/pwm-sun4i.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
>> index 6f5840a1a82d..53970d4ba695 100644
>> --- a/drivers/pwm/pwm-sun4i.c
>> +++ b/drivers/pwm/pwm-sun4i.c
>> @@ -156,7 +156,6 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,
>>  	if (sun4i_pwm->data->has_prescaler_bypass) {
>>  		/* First, test without any prescaler when available */
>>  		prescaler = PWM_PRESCAL_MASK;
>> -		pval = 1;
>>  		/*
>>  		 * When not using any prescaler, the clock period in nanoseconds
>>  		 * is not an integer so round it half up instead of
> 
> Are you sure?  It looks used to me.

It's only read in a do_div() and before that it is being assigned:

                        pval = prescaler_table[prescaler];
                        div = clk_rate;
                        do_div(div, pval);

so the assigned value of pval = 1 is never read

Colin
> 
> regards,
> dan carpenter
> 
