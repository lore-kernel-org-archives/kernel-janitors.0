From: David Ahern <dsahern@gmail.com>
Date: Thu, 28 May 2020 14:55:08 +0000
Subject: Re: [PATCH][net-next] nexthop: fix incorrect allocation failure on nhg->spare
Message-Id: <c557d49d-b3ab-be82-d879-39f2e2098c47@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528145114.420100-1-colin.king@canonical.com>
 <8b73e872-c05e-e93f-1d2d-3466da4ddbcc@cumulusnetworks.com>
In-Reply-To: <8b73e872-c05e-e93f-1d2d-3466da4ddbcc@cumulusnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, Colin King <colin.king@canonical.com>, David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/28/20 8:53 AM, Nikolay Aleksandrov wrote:
> On 28/05/2020 17:51, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The allocation failure check for nhg->spare is currently checking
>> the pointer nhg rather than nhg->spare which is never false. Fix
>> this by checking nhg->spare instead.
>>
>> Addresses-Coverity: ("Logically dead code")
>> Fixes: 430a049190de ("nexthop: Add support for nexthop groups")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  net/ipv4/nexthop.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
>> index ebafa5ed91ac..97423d6f2de9 100644
>> --- a/net/ipv4/nexthop.c
>> +++ b/net/ipv4/nexthop.c
>> @@ -1185,7 +1185,7 @@ static struct nexthop *nexthop_create_group(struct net *net,
>>  
>>  	/* spare group used for removals */
>>  	nhg->spare = nexthop_grp_alloc(num_nh);
>> -	if (!nhg) {
>> +	if (!nhg->spare) {
>>  		kfree(nhg);
>>  		kfree(nh);
>>  		return NULL;
>>
> 
> Good catch, embarrassing copy paste error :-/
> Acked-by: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
> 

I missed that as well.

Reviewed-by: David Ahern <dsahern@gmail.com>

Patch needs to go to -net
