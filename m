From: walter harms <wharms@bfs.de>
Date: Mon, 28 Jun 2010 13:22:49 +0000
Subject: Re: [PATCH 11/16] trivial: use ARRAY_SIZE
Message-Id: <4C28A229.10503@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726125-24765-1-git-send-email-segooon@gmail.com> <4C28989E.9010300@bfs.de>
In-Reply-To: <4C28989E.9010300@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: trivial@kernel.org, Kernel Janitors <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Simon Horman <horms@verge.net.au>, Andrea Gelmini <andrea.gelmini@gelma.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org



walter harms schrieb:
> 
> Kulikov Vasiliy schrieb:
>> Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).
>>
>> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
>> ---
>>  drivers/staging/otus/hal/hpreg.c |   17 +++++++----------
>>  1 files changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/otus/hal/hpreg.c b/drivers/staging/otus/hal/hpreg.c
>> index da3b774..9b04653 100644
>> --- a/drivers/staging/otus/hal/hpreg.c
>> +++ b/drivers/staging/otus/hal/hpreg.c
>> @@ -29,9 +29,6 @@
>>  #include "hpreg.h"
>>  #include "hpusb.h"
>>  
>> -/* used throughout this file... */
>> -#define	N(a)	(sizeof(a) / sizeof(a[0]))
>> -
>>  #define HAL_MODE_11A_TURBO	HAL_MODE_108A
>>  #define HAL_MODE_11G_TURBO	HAL_MODE_108G
>>  
>> @@ -1557,7 +1554,7 @@ u8_t GetWmRD(u16_t regionCode, u16_t channelFlag, REG_DOMAIN *rd)
>>  	u64_t flags = NO_REQ;
>>  	REG_DMN_PAIR_MAPPING *regPair = NULL;
>>  
>> -	for (i = 0, found = 0; (i < N(regDomainPairs)) && (!found); i++) {
>> +	for (i = 0, found = 0; (i < ARRAY_SIZE(regDomainPairs)) && (!found); i++) {
>>  		if (regDomainPairs[i].regDmnEnum = regionCode) {
>>  			regPair = &regDomainPairs[i];
>>  			found = 1;
> 
> 
> 
> This looks odd, i do not see the rest of the code but perhaps a break would help
> to eleminate the "found" ??
> 
> just my two cents,
>  wh
> 
1554 u8_t GetWmRD(u16_t regionCode, u16_t channelFlag, REG_DOMAIN *rd)
1555 {
1556         s16_t i, found, regDmn;
1557         u64_t flags=NO_REQ;
1558         REG_DMN_PAIR_MAPPING *regPair=NULL;
1559
1560         for (i=0, found=0; (i<N(regDomainPairs))&&(!found); i++)
1561         {
1562                 if (regDomainPairs[i].regDmnEnum = regionCode)
1563                 {
1564                         regPair = &regDomainPairs[i];
1565                         found = 1;
1566                 }
1567         }
1568         if (!found)
1569         {
1570                 zm_debug_msg1("Failed to find reg domain pair ", regionCode);
1571                 return FALSE;
1572         }


This is would stop at the first hit and work without found.
Otherwise someone could add an {NULL} at the end of the array
und use a while () that would eliminate the need for ARRAY_SIZE also.

re,
 wh

for (i=0; i<ARRAY_SIZE(regDomainPairs);i++ )
	if (regDomainPairs[i].regDmnEnum = regionCode)
                    { regPair = &regDomainPairs[i]; break ; }

if (!regPair) {
        zm_debug_msg1("Failed to find reg domain pair ", regionCode);
        return FALSE;
}



