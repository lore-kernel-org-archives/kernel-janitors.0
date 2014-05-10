From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 10 May 2014 10:38:55 +0000
Subject: Re: [patch] iio: hid-sensors: typo leads to potential forever loop
Message-Id: <536E01BF.6020702@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140509115617.GC32027@mwanda> <536D089C.9040307@linux.intel.com>
In-Reply-To: <536D089C.9040307@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/05/14 17:55, Srinivas Pandruvada wrote:
> OOPs. Good catch.
>
> Thanks,
> Srinivas
>
> On 05/09/2014 04:56 AM, Dan Carpenter wrote:
>> The "i < " was missing in this condition.
>>
>> Fixes: 5d02edfc3957 ('iio: hid-sensors: Convert units and exponent')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied to the togreg branch of iio.igt

Thanks,

>>
>> diff --git a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
>> index 3729646..3052eb1 100644
>> --- a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
>> +++ b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
>> @@ -327,7 +327,7 @@ int hid_sensor_format_scale(u32 usage_id,
>>       *val0 = 1;
>>       *val1 = 0;
>> -    for (i = 0; ARRAY_SIZE(unit_conversion); ++i) {
>> +    for (i = 0; i < ARRAY_SIZE(unit_conversion); ++i) {
>>           if (unit_conversion[i].usage_id = usage_id &&
>>               unit_conversion[i].unit = attr_info->units) {
>>               exp  = hid_sensor_convert_exponent(
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

