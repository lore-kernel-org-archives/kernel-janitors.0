From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 17:35:29 +0000
Subject: Re: [PATCH] wimax/i2400m: fix spelling mistake "unitialized" -> "uninitialized"
Message-Id: <8889cb0c-9f21-0e4f-7938-658c87aad37e@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180924171853.3294-1-colin.king@canonical.com>
 <db8575a7-a4ab-3234-3e59-06cdeffe0f59@cogentembedded.com>
In-Reply-To: <db8575a7-a4ab-3234-3e59-06cdeffe0f59@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 24/09/18 18:27, Sergei Shtylyov wrote:
> On 09/24/2018 08:18 PM, Colin King wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Trivial fix to spelling mistake in ms_to_errno array of error messages
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/net/wimax/i2400m/control.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wimax/i2400m/control.c b/drivers/net/wimax/i2400m/control.c
>> index 094cea775d0c..0475ad553707 100644
>> --- a/drivers/net/wimax/i2400m/control.c
>> +++ b/drivers/net/wimax/i2400m/control.c
>> @@ -257,7 +257,7 @@ static const struct
>>  	[I2400M_MS_ACCESSIBILITY_ERROR] = { "accesibility error", -EIO },
>>  	[I2400M_MS_BUSY] = { "busy", -EBUSY },
>>  	[I2400M_MS_CORRUPTED_TLV] = { "corrupted TLV", -EILSEQ },
>> -	[I2400M_MS_UNINITIALIZED] = { "not unitialized", -EILSEQ },
>> +	[I2400M_MS_UNINITIALIZED] = { "not uninitialized", -EILSEQ },
> 
>    I suspect they rather meant "not initialized".

Of course, that makes far more sense. I send a V2.

> 
> [...]
> 
> MBR, Sergei
> 
