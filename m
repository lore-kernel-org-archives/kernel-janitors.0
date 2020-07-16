From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 16 Jul 2020 16:05:04 +0000
Subject: Re: [PATCH] crypto: xts: use memmove to avoid overlapped memory copy
Message-Id: <dfca9007-c553-3724-ea52-ef86b919c9d6@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716152900.1709694-1-colin.king@canonical.com>
 <CAMj1kXEWyweZ0E3WHthEG9oiOpOS9UxtTB7xskAsF8FeinNg9w@mail.gmail.com>
In-Reply-To: <CAMj1kXEWyweZ0E3WHthEG9oiOpOS9UxtTB7xskAsF8FeinNg9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 16/07/2020 16:56, Ard Biesheuvel wrote:
> On Thu, 16 Jul 2020 at 18:29, Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a memcpy that performs a potential overlapped memory copy
>> from source b to destination b + 1.  Fix this by using the safer
>> memmove instead.
>>
>> Addresses-Coverity: ("Overlapping buffer in memory copy")
>> Fixes: 8083b1bf8163 ("crypto: xts - add support for ciphertext stealing")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  crypto/xts.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/crypto/xts.c b/crypto/xts.c
>> index 3565f3b863a6..fa3e6e7b7043 100644
>> --- a/crypto/xts.c
>> +++ b/crypto/xts.c
>> @@ -169,7 +169,7 @@ static int cts_final(struct skcipher_request *req,
>>                                       offset - XTS_BLOCK_SIZE);
>>
>>         scatterwalk_map_and_copy(b, rctx->tail, 0, XTS_BLOCK_SIZE, 0);
>> -       memcpy(b + 1, b, tail);
>> +       memmove(b + 1, b, tail);
> 
> This is a false positive: tail is guaranteed to be smaller than
> sizeof(*b), so memmove() is unnecessary here.
> 
> If changing to memcpy(&b[1], &b[0], tail) makes the warning go away, i
> am fine with it, but otherwise we should just leave it as is.

In that case, just leave it as is. Apologies for the noise.

Colin
> 
> 
>>         scatterwalk_map_and_copy(b, req->src, offset, tail, 0);
>>
>>         le128_xor(b, &rctx->t, b);
>> --
>> 2.27.0
>>
