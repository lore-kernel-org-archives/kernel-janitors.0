From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 28 Mar 2018 18:57:27 +0000
Subject: Re: [PATCH] test_bpf: Fix NULL vs IS_ERR() check in test_skb_segment()
Message-Id: <c76d47e1-100c-c2f3-4712-b338b80673f7@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328114836.GD29050@mwanda>
 <b76502fe-4aa0-599f-23e2-72a773c7f764@fb.com>
In-Reply-To: <b76502fe-4aa0-599f-23e2-72a773c7f764@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yonghong Song <yhs@fb.com>, Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, davem@davemloft.net

Hi David,

On 03/28/2018 06:19 PM, Yonghong Song wrote:
> On 3/28/18 4:48 AM, Dan Carpenter wrote:
>> The skb_segment() function returns error pointers on error.  It never
>> returns NULL.
>>
>> Fixes: 76db8087c4c9 ("net: bpf: add a test for skb_segment in test_bpf module")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/lib/test_bpf.c b/lib/test_bpf.c
>> index b2badf6b23cd..8e157806df7a 100644
>> --- a/lib/test_bpf.c
>> +++ b/lib/test_bpf.c
>> @@ -6649,7 +6649,7 @@ static __init int test_skb_segment(void)
>>       }
>>         segs = skb_segment(skb, features);
>> -    if (segs) {
>> +    if (!IS_ERR(segs)) {
>>           kfree_skb_list(segs);
>>           ret = 0;
>>           pr_info("%s: success in skb_segment!", __func__);
> 
> Oh, my bad. Thanks for the fix!
> Reviewed-by: Yonghong Song <yhs@fb.com>

If you have a chance, please take this fix directly into your net-next tree
since it also contains the original commit 76db8087c4c9 ("net: bpf: add a
test for skb_segment in test_bpf module"), which is not in the bpf-next tree
at this point.

Thanks a lot,
Daniel
