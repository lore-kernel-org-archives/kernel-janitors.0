From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 13 Jun 2017 10:40:37 +0000
Subject: Re: [PATCH][crypto-next] crypto: cavium: fix spelling mistake "Revsion" -> "Revision"
Message-Id: <accc9c81-7f3c-6ebf-ff73-969cffc4b575@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170613085254.20855-1-colin.king@canonical.com>
 <1497350172.18751.11.camel@perches.com>
In-Reply-To: <1497350172.18751.11.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 13/06/17 11:36, Joe Perches wrote:
> On Tue, 2017-06-13 at 09:52 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Trivial fix to spelling mistake in seq_printf message
> 
> Hey Colin.
> 
> Fixing spelling typos is a good thing, but is it a
> good thing to change possibly API dependent output
> in seq_ calls?

Considering it's in -next and has not landed in upstream I supposed it
was better to fix it now before it landed in Linus' repo.

Colin

> 
>> diff --git a/drivers/crypto/cavium/nitrox/nitrox_main.c b/drivers/crypto/cavium/nitrox/nitrox_main.c
> []
>> @@ -399,7 +399,7 @@ static int nitrox_show(struct seq_file *s, void *v)
>>  	struct nitrox_device *ndev = s->private;
>>  
>>  	seq_printf(s, "NITROX-5 [idx: %d]\n", ndev->idx);
>> -	seq_printf(s, "  Revsion ID: 0x%0x\n", ndev->hw.revision_id);
>> +	seq_printf(s, "  Revision ID: 0x%0x\n", ndev->hw.revision_id);
>>  	seq_printf(s, "  Cores [AE: %u  SE: %u]\n",
>>  		   ndev->hw.ae_cores, ndev->hw.se_cores);
>>  	seq_printf(s, "  Number of Queues: %u\n", ndev->nr_queues);
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

