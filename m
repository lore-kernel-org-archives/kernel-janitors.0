From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Date: Thu, 18 Jun 2020 10:40:55 +0000
Subject: Re: [PATCH] crypto: caam/qi2: remove redundant assignment to ret
Message-Id: <5452e045-bd48-3b29-b364-bf123540ae21@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611153934.928021-1-colin.king@canonical.com>
 <20200618075816.GI10091@gondor.apana.org.au>
In-Reply-To: <20200618075816.GI10091@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Colin King <colin.king@canonical.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>, "David S . Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 6/18/2020 10:58 AM, Herbert Xu wrote:
> On Thu, Jun 11, 2020 at 04:39:34PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable ret is being assigned a value that is never read, the
>> error exit path via label 'unmap' returns -ENOMEM anyhow, so assigning
>> ret with -ENOMEM is redundamt.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/crypto/caam/caamalg_qi2.c | 2 --
>>  1 file changed, 2 deletions(-)
> 
> Patch applied.  Thanks.
> 
Unfortunately I missed this patch, and it doesn't look correct.

Do I need to send a revert?

Thanks,
Horia
