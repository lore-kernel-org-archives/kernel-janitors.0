From: walter harms <wharms@bfs.de>
Date: Wed, 03 May 2017 17:20:32 +0000
Subject: Re: [PATCH] net/sched: remove redundant null check on head
Message-Id: <590A1160.8050802@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503135040.32023-1-colin.king@canonical.com>
In-Reply-To: <20170503135040.32023-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 03.05.2017 17:12, schrieb Jiri Pirko:
> Wed, May 03, 2017 at 04:21:15PM CEST, wharms@bfs.de wrote:
>>
>>
>> Am 03.05.2017 15:50, schrieb Colin King:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> head is previously null checked and so the 2nd null check on head
>>> is redundant and therefore can be removed.
>>>
>>> Detected by CoverityScan, CID#1399505 ("Logically dead code")
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  net/sched/cls_matchall.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/net/sched/cls_matchall.c b/net/sched/cls_matchall.c
>>> index 2efb36c08f2a..dee469fed967 100644
>>> --- a/net/sched/cls_matchall.c
>>> +++ b/net/sched/cls_matchall.c
>>> @@ -203,8 +203,7 @@ static int mall_change(struct net *net, struct sk_buff *in_skb,
>>>  
>>>  	*arg = (unsigned long) head;
>>>  	rcu_assign_pointer(tp->root, new);
>>> -	if (head)
>>> -		call_rcu(&head->rcu, mall_destroy_rcu);
>>> +	call_rcu(&head->rcu, mall_destroy_rcu);
>>>  	return 0;
>>>  
>>>  err_replace_hw_filter:
>>
>>
>> if someone cares .. the err=0 in the the line above the patch is also useless
>> because err is never used again. Merging both if will save 1 indent level.
>>
>> err = mall_replace_hw_filter(tp, new, (unsigned long) new);
>> if (err && tc_skip_sw(flags) )
>> 	goto errout;
> 
> 
> true, however unrelated to this patch :)
> 
> Please submit as a separate patch.
> 

I have no linux git tree available, some one may take this.

re,
 wh
