From: Yuehaibing <yuehaibing@huawei.com>
Date: Fri, 03 Jan 2020 08:25:22 +0000
Subject: Re: [PATCH net-next] ethtool: remove set but not used variable 'lsettings'
Message-Id: <532c6c68-4dd6-bd08-2a86-a257f3384156@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200103034856.177906-1-yuehaibing@huawei.com>
 <20200103073923.GA4769@unicorn.suse.cz>
In-Reply-To: <20200103073923.GA4769@unicorn.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Kubecek <mkubecek@suse.cz>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On 2020/1/3 15:39, Michal Kubecek wrote:
> On Fri, Jan 03, 2020 at 03:48:56AM +0000, YueHaibing wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> net/ethtool/linkmodes.c: In function 'ethnl_set_linkmodes':
>> net/ethtool/linkmodes.c:326:32: warning:
>>  variable 'lsettings' set but not used [-Wunused-but-set-variable]
>>   struct ethtool_link_settings *lsettings;
>>                                 ^
>> It is never used, so remove it.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  net/ethtool/linkmodes.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/net/ethtool/linkmodes.c b/net/ethtool/linkmodes.c
>> index 0b99f494ad3b..96f20be64553 100644
>> --- a/net/ethtool/linkmodes.c
>> +++ b/net/ethtool/linkmodes.c
>> @@ -323,7 +323,6 @@ int ethnl_set_linkmodes(struct sk_buff *skb, struct genl_info *info)
>>  {
>>  	struct nlattr *tb[ETHTOOL_A_LINKMODES_MAX + 1];
>>  	struct ethtool_link_ksettings ksettings = {};
>> -	struct ethtool_link_settings *lsettings;
>>  	struct ethnl_req_info req_info = {};
>>  	struct net_device *dev;
>>  	bool mod = false;
>> @@ -354,7 +353,6 @@ int ethnl_set_linkmodes(struct sk_buff *skb, struct genl_info *info)
>>  			GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
>>  		goto out_ops;
>>  	}
>> -	lsettings = &ksettings.base;
>>  
>>  	ret = ethnl_update_linkmodes(info, tb, &ksettings, &mod);
>>  	if (ret < 0)
> 
> Reviewed-by: Michal Kubecek <mkubecek@suse.cz>
> 
> Thank you. I wonder why my compiler does not complain.

Using make W=1

> 
> Michal
> 
> .
> 
