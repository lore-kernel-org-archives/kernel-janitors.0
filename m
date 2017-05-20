From: Jiri Pirko <jiri@resnulli.us>
Date: Sat, 20 May 2017 07:13:15 +0000
Subject: Re: [PATCH] net: sched: fix a use-after-free error on chain on the error exit path
Message-Id: <20170520071315.GB1833@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518140702.6072-1-colin.king@canonical.com>
 <CAM_iQpX+aSOK8+K5eU1s=2LJzZgBdCvWBkhuT3ByZSqKWpSSvw@mail.gmail.com>
In-Reply-To: <CAM_iQpX+aSOK8+K5eU1s=2LJzZgBdCvWBkhuT3ByZSqKWpSSvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Jamal Hadi Salim <jhs@mojatatu.com>, "David S . Miller" <davem@davemloft.net>, Linux Kernel Network Developers <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Fri, May 19, 2017 at 07:17:59PM CEST, xiyou.wangcong@gmail.com wrote:
>On Thu, May 18, 2017 at 7:07 AM, Colin King <colin.king@canonical.com> wrote:
>> diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
>> index 4020b8d932a1..82ebdc3fcb2e 100644
>> --- a/net/sched/cls_api.c
>> +++ b/net/sched/cls_api.c
>> @@ -511,6 +511,7 @@ static int tc_ctl_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
>>         if (n->nlmsg_type = RTM_DELTFILTER && prio = 0) {
>>                 tfilter_notify_chain(net, skb, n, chain, RTM_DELTFILTER);
>>                 tcf_chain_destroy(chain);
>
>
>Jiri, how does this work...? An action could hold a refcnt to a filter
>chain, but here you destroy a whole chain without respecting
>the refcnt???

Correct. I missed this. Will fix, thanks.


>
>
>> +               chain = NULL;
>>                 err = 0;
>>                 goto errout;
>
>Colin, not your fault, I think we may miss something more serious
>when reviewing Jiri's patchset. ;)
>
>Thanks.
