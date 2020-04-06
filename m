From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 06 Apr 2020 23:51:40 +0000
Subject: Re: [PATCH] nft_set_pipapo: remove unused pointer lt
Message-Id: <8a0bc11f-24c0-228a-1f06-dd2c44780318@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200406232031.657615-1-colin.king@canonical.com>
 <20200407013951.77a6409f@redhat.com>
In-Reply-To: <20200407013951.77a6409f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/04/2020 00:39, Stefano Brivio wrote:
> Hi Colin,
> 
> On Tue,  7 Apr 2020 00:20:31 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Pointer lt being assigned with a value that is never read and
>> the pointer is redundant and can be removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  net/netfilter/nft_set_pipapo_avx2.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/net/netfilter/nft_set_pipapo_avx2.c b/net/netfilter/nft_set_pipapo_avx2.c
>> index d65ae0e23028..9458c6b6ea04 100644
>> --- a/net/netfilter/nft_set_pipapo_avx2.c
>> +++ b/net/netfilter/nft_set_pipapo_avx2.c
>> @@ -1049,11 +1049,9 @@ static int nft_pipapo_avx2_lookup_slow(unsigned long *map, unsigned long *fill,
>>  					struct nft_pipapo_field *f, int offset,
>>  					const u8 *pkt, bool first, bool last)
>>  {
>> -	unsigned long *lt = f->lt, bsize = f->bsize;
>> +	unsigned long bsize = f->bsize;
>>  	int i, ret = -1, b;
>>  
>> -	lt += offset * NFT_PIPAPO_LONGS_PER_M256;
>> -
>>  	if (first)
>>  		memset(map, 0xff, bsize * sizeof(*map));
>>  
>         for (i = offset; i < bsize; i++) {
>                 if (f->bb = 8)
>                         pipapo_and_field_buckets_8bit(f, map, pkt);
>                 else
>                         pipapo_and_field_buckets_4bit(f, map, pkt);
> 
> Now, this function should never be called, it's provided as a safety net
> in case this algorithm is ever run with some strange packet field size,
> still, your clean-up shows another "issue" here: as
> pipapo_and_field_buckets_*() functions use the full buckets in lookup
> tables, not just starting from an offset, there's no need to repeat
> those operations starting from offset up to bsize.
> 
> It's fine to ignore the offset (which is just a "hint" here for faster
> lookups) -- this function isn't supposed to be optimised in any way.

Ah, OK, thanks for the detailed explanation.

> 
> That is, this for loop should go away altogether, and the 'offset'
> argument should be dropped as well. Let me know if you're comfortable
> taking care of that as well, or if you prefer that I send a patch.

Probably at this point I think I'll pass the baton over to you to fix
this up as you understand the code more than I do.

> 

Cheers,

Colin
