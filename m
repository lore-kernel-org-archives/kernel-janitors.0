From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 08 May 2020 23:31:03 +0000
Subject: Re: [PATCH] net: tg3: tidy up loop, remove need to compute off with a multiply
Message-Id: <160ce1ee-3bb5-3357-64f3-e5dea8c0538d@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508225301.484094-1-colin.king@canonical.com>
 <1890306fc8c9306abe11186d419d84f784ee6144.camel@perches.com>
In-Reply-To: <1890306fc8c9306abe11186d419d84f784ee6144.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Siva Reddy Kallam <siva.kallam@broadcom.com>, Prashant Sreedharan <prashant@broadcom.com>, Michael Chan <mchan@broadcom.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/05/2020 00:21, Joe Perches wrote:
> On Fri, 2020-05-08 at 23:53 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the value for 'off' is computed using a multiplication and
>> a couple of statements later off is being incremented by len and
>> this value is never read.  Clean up the code by removing the
>> multiplication and just increment off by len on each iteration. Also
>> use len instead of TG3_OCIR_LEN.
> 
> I think this is a lot harder to read.
> 
>> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> []
>> @@ -10798,16 +10798,14 @@ static int tg3_init_hw(struct tg3 *tp, bool reset_phy)
>>  static void tg3_sd_scan_scratchpad(struct tg3 *tp, struct tg3_ocir *ocir)
>>  {
>>  	int i;
>> +	u32 off, len = TG3_OCIR_LEN;
>>  
>> -	for (i = 0; i < TG3_SD_NUM_RECS; i++, ocir++) {
>> -		u32 off = i * TG3_OCIR_LEN, len = TG3_OCIR_LEN;
>> -
>> +	for (i = 0, off = 0; i < TG3_SD_NUM_RECS; i++, ocir++, off += len) {
>>  		tg3_ape_scratchpad_read(tp, (u32 *) ocir, off, len);
>> -		off += len;
>>  
>>  		if (ocir->signature != TG3_OCIR_SIG_MAGIC ||
>>  		    !(ocir->version_flags & TG3_OCIR_FLAG_ACTIVE))
>> -			memset(ocir, 0, TG3_OCIR_LEN);
>> +			memset(ocir, 0, len);
>>  	}
>>  }
> 
> My preference would be for
> 
> {
> 	int i;
> 	u32 off = 0;
> 
> 	for (i = 0; i < TG3_SD_NUM_RECS; i++) {
> 		tg3_ape_scratchpad_read(tp, (u32 *)ocir, off, TC3_OCIR_LEN);
> 
> 		if (ocir->signature != TG3_OCIR_SIG_MAGIC ||
> 		    !(ocir->version_flags & TG3_OCIR_FLAG_ACTIVE))
> 			memset(ocir, 0, TG3_OCIR_LEN);
> 
> 		off += TG3_OCIR_LEN;
> 		ocir++;
> 	}
> 
OK, I'll send a V3 tomorrow.
