From: zhong jiang <zhongjiang@huawei.com>
Date: Wed, 04 Sep 2019 15:21:01 +0000
Subject: Re: net: hsr: remove a redundant null check before kfree_skb
Message-Id: <5D6FD65D.1060507@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1567566558-7764-1-git-send-email-zhongjiang@huawei.com> <ce4f53c1-fd91-af5b-7f0a-4746c3ad8de1@web.de>
In-Reply-To: <ce4f53c1-fd91-af5b-7f0a-4746c3ad8de1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Arvid Brodin <arvid.brodin@alten.se>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019/9/4 19:55, Markus Elfring wrote:
>> kfree_skb has taken the null pointer into account.
> I suggest to take another look also at information around
> a similar update suggestion.
>
> net-hsr: Delete unnecessary checks before the function call "kfree_skb"
> https://lkml.org/lkml/2015/11/14/120
> https://lore.kernel.org/patchwork/patch/617878/
> https://lore.kernel.org/r/5647A77E.6040501@users.sourceforge.net/
>
> https://lkml.org/lkml/2015/11/24/433
> https://lore.kernel.org/r/56546951.9080101@alten.se/
Thanks you for explaination. I miss the similar patch before sending it.

Sincerely,
zhong jiang
> Regards,
> Markus
>
> .
>
