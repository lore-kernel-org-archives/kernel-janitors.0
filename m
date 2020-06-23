From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 23 Jun 2020 11:12:42 +0000
Subject: Re: [PATCH][next] mm/zswap: fix a couple of memory leaks and rework kzalloc failure check
Message-Id: <baf5a045-40f3-254b-fe0f-ad00cdf4b775@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200622153546.49880-1-colin.king@canonical.com>
 <20200622182816.GF4151@kadam>
 <B926444035E5E2439431908E3842AFD2514C4B@DGGEMI525-MBS.china.huawei.com>
In-Reply-To: <B926444035E5E2439431908E3842AFD2514C4B@DGGEMI525-MBS.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 22/06/2020 20:55, Song Bao Hua (Barry Song) wrote:
> 
> 
>> -----Original Message-----
>> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>> Sent: Tuesday, June 23, 2020 6:28 AM
>> To: Colin King <colin.king@canonical.com>
>> Cc: Seth Jennings <sjenning@redhat.com>; Dan Streetman
>> <ddstreet@ieee.org>; Vitaly Wool <vitaly.wool@konsulko.com>; Andrew
>> Morton <akpm@linux-foundation.org>; Song Bao Hua (Barry Song)
>> <song.bao.hua@hisilicon.com>; Stephen Rothwell <sfr@canb.auug.org.au>;
>> linux-mm@kvack.org; kernel-janitors@vger.kernel.org;
>> linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH][next] mm/zswap: fix a couple of memory leaks and
>> rework kzalloc failure check
>>
>> On Mon, Jun 22, 2020 at 04:35:46PM +0100, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> kzalloc failures return NULL on out of memory errors, so replace the
>>> IS_ERR_OR_NULL check with the usual null pointer check.  Fix two memory
>>> leaks with on acomp and acomp_ctx by ensuring these objects are free'd
>>> on the error return path.
>>>
>>> Addresses-Coverity: ("Resource leak")
>>> Fixes: d4f86abd6e35 ("mm/zswap: move to use crypto_acomp API for
>> hardware acceleration")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> 
> Colin, thanks for your patch. I am sorry I did the same thing with you here:
> https://lkml.org/lkml/2020/6/22/347

Thanks for fixing this correctly, I ran out of time yesterday to re-do
the fix.

Colin

> 
> 
>>> ---
>>>  mm/zswap.c | 16 +++++++++++-----
>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/mm/zswap.c b/mm/zswap.c
>>> index 0d914ba6b4a0..14839cbac7ff 100644
>>> --- a/mm/zswap.c
>>> +++ b/mm/zswap.c
>>> @@ -433,23 +433,23 @@ static int zswap_cpu_comp_prepare(unsigned int
>> cpu, struct hlist_node *node)
>>>  		return 0;
>>>
>>>  	acomp_ctx = kzalloc(sizeof(*acomp_ctx), GFP_KERNEL);
>>> -	if (IS_ERR_OR_NULL(acomp_ctx)) {
>>> +	if (!acomp_ctx) {
>>>  		pr_err("Could not initialize acomp_ctx\n");
>>>  		return -ENOMEM;
>>>  	}
>>>  	acomp = crypto_alloc_acomp(pool->tfm_name, 0, 0);
>>> -	if (IS_ERR_OR_NULL(acomp)) {
>>> +	if (!acomp) {
>>
>> This should be IS_ERR(acomp).  Please preserve the error code.
>>
>>>  		pr_err("could not alloc crypto acomp %s : %ld\n",
>>>  				pool->tfm_name, PTR_ERR(acomp));
>>> -		return -ENOMEM;
>>> +		goto free_acomp_ctx;
>>>  	}
>>>  	acomp_ctx->acomp = acomp;
>>>
>>>  	req = acomp_request_alloc(acomp_ctx->acomp);
>>> -	if (IS_ERR_OR_NULL(req)) {
>>> +	if (!req) {
>>>  		pr_err("could not alloc crypto acomp %s : %ld\n",
>>>  		       pool->tfm_name, PTR_ERR(acomp));
>>> -		return -ENOMEM;
>>> +		goto free_acomp;
>>>  	}
>>>  	acomp_ctx->req = req;
>>>
>>> @@ -462,6 +462,12 @@ static int zswap_cpu_comp_prepare(unsigned int
>> cpu, struct hlist_node *node)
>>>  	*per_cpu_ptr(pool->acomp_ctx, cpu) = acomp_ctx;
>>>
>>>  	return 0;
>>> +
>>> +free_acomp:
>>> +	kfree(acomp);
>>
>> The kfree() isn't correct.  It needs to be:
>>
>> 	crypto_free_acomp(acomp);
>>
>>> +free_acomp_ctx:
>>> +	kfree(acomp_ctx);
>>> +	return -ENOMEM;
>>
>> regards,
>> dan carpenter
> 
