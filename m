From: walter harms <wharms@bfs.de>
Date: Wed, 16 Oct 2019 07:20:06 +0000
Subject: Re: [PATCH] PNP: fix unintended sign extension on left shifts
Message-Id: <5DA6C4A6.6090207@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191014131608.31335-1-colin.king@canonical.com> <cda044bf-4aec-4423-007c-1d6cf6f0eecf@intel.com>
In-Reply-To: <cda044bf-4aec-4423-007c-1d6cf6f0eecf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 15.10.2019 18:29, schrieb Rafael J. Wysocki:
> On 10/14/2019 3:16 PM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Shifting a u8 left will cause the value to be promoted to an integer. If
>> the top bit of the u8 is set then the following conversion to a 64 bit
>> resource_size_t will sign extend the value causing the upper 32 bits
>> to be set in the result.
>>
>> Fix this by casting the u8 value to a resource_size_t before the shift.
>> Original commit is pre-git history.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Please resend this with a Cc to linux-acpi@vger.kernel.org for easier
> handling.
> 
> 
>> ---
>>   drivers/pnp/isapnp/core.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pnp/isapnp/core.c b/drivers/pnp/isapnp/core.c
>> index 179b737280e1..c947b1673041 100644
>> --- a/drivers/pnp/isapnp/core.c
>> +++ b/drivers/pnp/isapnp/core.c
>> @@ -511,10 +511,14 @@ static void __init
>> isapnp_parse_mem32_resource(struct pnp_dev *dev,
>>       unsigned char flags;
>>         isapnp_peek(tmp, size);
>> -    min = (tmp[4] << 24) | (tmp[3] << 16) | (tmp[2] << 8) | tmp[1];
>> -    max = (tmp[8] << 24) | (tmp[7] << 16) | (tmp[6] << 8) | tmp[5];
>> -    align = (tmp[12] << 24) | (tmp[11] << 16) | (tmp[10] << 8) | tmp[9];
>> -    len = (tmp[16] << 24) | (tmp[15] << 16) | (tmp[14] << 8) | tmp[13];
>> +    min = ((resource_size_t)tmp[4] << 24) | (tmp[3] << 16) |
>> +              (tmp[2] << 8) | tmp[1];
>> +    max = ((resource_size_t)tmp[8] << 24) | (tmp[7] << 16) |
>> +              (tmp[6] << 8) | tmp[5];
>> +    align = ((resource_size_t)tmp[12] << 24) | (tmp[11] << 16) |
>> +              (tmp[10] << 8) | tmp[9];
>> +    len = ((resource_size_t)tmp[16] << 24) | (tmp[15] << 16) |
>> +              (tmp[14] << 8) | tmp[13];
>>       flags = tmp[0];
>>       pnp_register_mem_resource(dev, option_flags,
>>                     min, max, align, len, flags);
>> @@ -532,8 +536,10 @@ static void __init
>> isapnp_parse_fixed_mem32_resource(struct pnp_dev *dev,
>>       unsigned char flags;
>>         isapnp_peek(tmp, size);
>> -    base = (tmp[4] << 24) | (tmp[3] << 16) | (tmp[2] << 8) | tmp[1];
>> -    len = (tmp[8] << 24) | (tmp[7] << 16) | (tmp[6] << 8) | tmp[5];
>> +    base = ((resource_size_t)tmp[4] << 24) | (tmp[3] << 16) |
>> +           (tmp[2] << 8) | tmp[1];
>> +    len = ((resource_size_t)tmp[8] << 24) | (tmp[7] << 16) |
>> +              (tmp[6] << 8) | tmp[5];
>>       flags = tmp[0];
>>       pnp_register_mem_resource(dev, option_flags, base, base, 0, len,
>> flags);
>>   }
> 
> 

there was a hint to use get/put_unaligned_be*() maybe that is here also possible ?

re,
 wh

(ps: see: [PATCH] scsi: fix unintended sign extension on left shifts)
> 
