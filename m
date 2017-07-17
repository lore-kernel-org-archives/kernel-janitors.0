From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 17 Jul 2017 10:50:12 +0000
Subject: Re: [PATCH] mfd: rtsx: make arrays depth and cd_mask static const
Message-Id: <855747ac-26db-4d4d-83c4-fddf95656f7a@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630093327.8595-1-colin.king@canonical.com>
 <20170717104644.igajn5icexlowvkt@dell>
In-Reply-To: <20170717104644.igajn5icexlowvkt@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/07/17 11:46, Lee Jones wrote:
> Please start the commit subject description with an uppercase char.
> 
>> From: Colin Ian King <colin.king@canonical.com>
> 
> This is odd.  How are you sending this patch Colin?

git send-patch. Hrm. I'll check it out for next time.

Colin

> 
>> Don't populate the arrays depath and cd_mask on the stack but make
>> them static const.  Makes the object code smaller:
>>
>>    text    data     bss     dec     hex filename
>>   25413    7216     448   33077    8135 drivers/mfd/rtsx_pcr.o
>>
>>    text    data     bss     dec     hex filename
>>   25151    7360     448   32959    80bf drivers/mfd/rtsx_pcr.o
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/mfd/rtsx_pcr.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> I'll fix the $SUBJECT line.
> 
> Applied, thanks.
> 
>> diff --git a/drivers/mfd/rtsx_pcr.c b/drivers/mfd/rtsx_pcr.c
>> index a0ac89dfdf0f..3cf69e5c5703 100644
>> --- a/drivers/mfd/rtsx_pcr.c
>> +++ b/drivers/mfd/rtsx_pcr.c
>> @@ -644,7 +644,7 @@ int rtsx_pci_switch_clock(struct rtsx_pcr *pcr, unsigned int card_clock,
>>  {
>>  	int err, clk;
>>  	u8 n, clk_divider, mcu_cnt, div;
>> -	u8 depth[] = {
>> +	static const u8 depth[] = {
>>  		[RTSX_SSC_DEPTH_4M] = SSC_DEPTH_4M,
>>  		[RTSX_SSC_DEPTH_2M] = SSC_DEPTH_2M,
>>  		[RTSX_SSC_DEPTH_1M] = SSC_DEPTH_1M,
>> @@ -768,7 +768,7 @@ EXPORT_SYMBOL_GPL(rtsx_pci_card_power_off);
>>  
>>  int rtsx_pci_card_exclusive_check(struct rtsx_pcr *pcr, int card)
>>  {
>> -	unsigned int cd_mask[] = {
>> +	static const unsigned int cd_mask[] = {
>>  		[RTSX_SD_CARD] = SD_EXIST,
>>  		[RTSX_MS_CARD] = MS_EXIST
>>  	};
> 

