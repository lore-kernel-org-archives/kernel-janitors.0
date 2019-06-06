From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 06 Jun 2019 13:08:10 +0000
Subject: Re: [PATCH] hwmon: nct7904: fix error check on register read
Message-Id: <cbee6a7c-4cef-3558-842b-9ba0d73a806e@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190606122707.16107-1-colin.king@canonical.com>
 <52b996c1-a52e-8cd6-e570-53b873768bc4@roeck-us.net>
In-Reply-To: <52b996c1-a52e-8cd6-e570-53b873768bc4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Guenter Roeck <linux@roeck-us.net>, "amy . shih" <amy.shih@advantech.com.tw>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/06/2019 14:02, Guenter Roeck wrote:
> Hi Colin,
> 
> On 6/6/19 5:27 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the return from the call to nct7904_read is being masked
>> and so and negative error returns are being stripped off and the
>> error check is always false.  Fix this by checking on err first and
>> then masking the return value in ret.
>>
>> Addresses-Coverity: ("Logically dead code")
>> Fixes: af55ab0b0792 ("hwmon: (nct7904) Add extra sysfs support for
>> fan, voltage and temperature.")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks a lot for the patch. The offending patch had several additional
> problems (shame on me for sloppy review), so I pulled it from the branch
> and asked the author to fix all problems and resubmit.

Ah, good. I was going to address some other issues too. That saves some
work.

Colin

> 
> Guenter
> 
>> ---
>>   drivers/hwmon/nct7904.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
>> index dd450dd29ac7..5fa69898674c 100644
>> --- a/drivers/hwmon/nct7904.c
>> +++ b/drivers/hwmon/nct7904.c
>> @@ -928,10 +928,10 @@ static int nct7904_probe(struct i2c_client *client,
>>         /* Check DTS enable status */
>>       if (data->enable_dts) {
>> -        ret = nct7904_read_reg(data, BANK_0, DTS_T_CTRL0_REG) & 0xF;
>> +        ret = nct7904_read_reg(data, BANK_0, DTS_T_CTRL0_REG);
>>           if (ret < 0)
>>               return ret;
>> -        data->has_dts = ret;
>> +        data->has_dts = ret & 0xF;
>>           if (data->enable_dts & ENABLE_TSI) {
>>               ret = nct7904_read_reg(data, BANK_0, DTS_T_CTRL1_REG);
>>               if (ret < 0)
>>
> 
