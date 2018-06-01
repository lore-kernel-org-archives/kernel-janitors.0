From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Fri, 01 Jun 2018 14:22:28 +0000
Subject: Re: [PATCH] qtnfmac: fix NULL pointer dereference
Message-Id: <14b57d7b-15cf-dfd8-d64c-2200d435d2f6@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601132408.GA2572@embeddedor.com>
 <20180601140848.czb4ws5nixuk4tjb@bars>
In-Reply-To: <20180601140848.czb4ws5nixuk4tjb@bars>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Sergey,

On 06/01/2018 09:08 AM, Sergey Matyukevich wrote:
> Hello Gustavo,
> 
>> diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
>> index 220e2b7..ae0ca80 100644
>> --- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
>> +++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
>> @@ -654,8 +654,7 @@ qtnf_disconnect(struct wiphy *wiphy, struct net_device *dev,
>>          vif = qtnf_mac_get_base_vif(mac);
>>          if (!vif) {
>>                  pr_err("MAC%u: primary VIF is not configured\n", mac->macid);
>> -               ret = -EFAULT;
>> -               goto out;
>> +               return -EFAULT;
>>          }
>>
>>          if (vif->wdev.iftype != NL80211_IFTYPE_STATION) {
> 
> That was my fault. Thanks for the fix!
> 

Glad to help. :)

> Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quanenna.com>
> 

Thanks
--
Gustavo
