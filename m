From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 10 Oct 2017 06:05:47 +0000
Subject: Re: [PATCH 1/2] crypto: lrw - Fix an error handling path in 'create()'
Message-Id: <573ace7e-a5d4-44ef-e6df-9d5fe1e61e6e@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1507445539.git.christophe.jaillet@wanadoo.fr>
 <53e4cc621176b8aeeb58e493b133be853c66ef49.1507445539.git.christophe.jaillet@wanadoo.fr>
 <59DBE89C.3090700@bfs.de>
In-Reply-To: <59DBE89C.3090700@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: wharms@bfs.de
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 09/10/2017 à 23:22, walter harms a écrit :
> Am 08.10.2017 11:39, schrieb Christophe JAILLET:
>> All error handling paths 'goto err_drop_spawn' except this one.
>> In order to avoid some resources leak, we should do it as well here.
>>
>> Fixes: 700cb3f5fe75 ("crypto: lrw - Convert to skcipher")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   crypto/lrw.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/crypto/lrw.c b/crypto/lrw.c
>> index a8bfae4451bf..eb681e9fe574 100644
>> --- a/crypto/lrw.c
>> +++ b/crypto/lrw.c
>> @@ -610,8 +610,10 @@ static int create(struct crypto_template *tmpl, struct rtattr **tb)
>>   		ecb_name[len - 1] = 0;
>>   
>>   		if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
>> -			     "lrw(%s)", ecb_name) >= CRYPTO_MAX_ALG_NAME)
> 	this check can be done more easy,
> 	the length of ecb_name is len
> 	the length of inst->alg.base.cra_name is CRYPTO_MAX_ALG_NAME
> 	if CRYPTO_MAX_ALG_NAME-len < "lrw()" < 5
> 		no need to involve snprintf()
>
> 	just my 2 cents
> 	re,
>   		wh
It does not only check for the length, it also copies some data.
The test should be read: "If the copy succeeds (i.e if there is enough 
space for the copy to succeed)", and not "if the string is too long".
IMHO, the snprintf is just fine here.

CJ
>> -			return -ENAMETOOLONG;
>> +			     "lrw(%s)", ecb_name) >= CRYPTO_MAX_ALG_NAME) {
>> +			err = -ENAMETOOLONG;
>> +			goto err_drop_spawn;
>> +		}
>>   	}
>>   
>>   	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;


