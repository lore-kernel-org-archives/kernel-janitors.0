From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 04 Sep 2019 11:55:54 +0000
Subject: Re: net: hsr: remove a redundant null check before kfree_skb
Message-Id: <ce4f53c1-fd91-af5b-7f0a-4746c3ad8de1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1567566558-7764-1-git-send-email-zhongjiang@huawei.com>
In-Reply-To: <1567566558-7764-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zhong jiang <zhongjiang@huawei.com>, Arvid Brodin <arvid.brodin@alten.se>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> kfree_skb has taken the null pointer into account.

I suggest to take another look also at information around
a similar update suggestion.

net-hsr: Delete unnecessary checks before the function call "kfree_skb"
https://lkml.org/lkml/2015/11/14/120
https://lore.kernel.org/patchwork/patch/617878/
https://lore.kernel.org/r/5647A77E.6040501@users.sourceforge.net/

https://lkml.org/lkml/2015/11/24/433
https://lore.kernel.org/r/56546951.9080101@alten.se/

Regards,
Markus
