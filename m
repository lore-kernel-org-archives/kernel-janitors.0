From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 11 Feb 2020 16:41:31 +0000
Subject: Re: [PATCH][next] hwmon: axi-fan-control: fix uninitialized dereference of pointer res
Message-Id: <c4dfa7e1-a833-7bfd-2d5b-800892fb5fe4@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200211162059.94233-1-colin.king@canonical.com>
 <20200211163910.GA2975@roeck-us.net>
In-Reply-To: <20200211163910.GA2975@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/02/2020 16:39, Guenter Roeck wrote:
> On Tue, Feb 11, 2020 at 04:20:59PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the resource pointer ret is uninitialized and it is
>> being dereferenced when printing out a debug message. Fix this
>> by fetching the resource and assigning pointer res.  It is
>> a moot point that we sanity check for a null res since a successful
>> call to devm_platform_ioremap_resource has already occurred so
>> in theory it should never be non-null.
>>
>> Addresses-Coverity: ("Uninitialized pointer read")
>> Fixes: 690dd9ce04f6 ("hwmon: Support ADI Fan Control IP")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This has already been fixed by removing the message (and the
> then unused variable). The message was useless anyway since
> it printed the remapped address with %p.
> 
> Guenter

OK, thanks. My static anaylsis can't keep up!
> 
>> ---
>>  drivers/hwmon/axi-fan-control.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
>> index 8041ba7cc152..36e0d060510a 100644
>> --- a/drivers/hwmon/axi-fan-control.c
>> +++ b/drivers/hwmon/axi-fan-control.c
>> @@ -415,6 +415,9 @@ static int axi_fan_control_probe(struct platform_device *pdev)
>>  	if (!ctl->clk_rate)
>>  		return -EINVAL;
>>  
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -EINVAL;
>>  	dev_dbg(&pdev->dev, "Re-mapped from 0x%08llX to %p\n",
>>  		(unsigned long long)res->start, ctl->base);
>>  
>> -- 
>> 2.25.0
>>
