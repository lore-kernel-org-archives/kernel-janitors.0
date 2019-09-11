From: David Miller <davem@davemloft.net>
Date: Wed, 11 Sep 2019 08:14:28 +0000
Subject: Re: [PATCH v2 net] net: sonic: replace dev_kfree_skb in sonic_send_packet
Message-Id: <20190911.101428.1457711904338692410.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a48a6690-eeb4-91d2-bed8-439d14b63e2f@cogentembedded.com>
        <20190911013623.36897-1-maowenan@huawei.com>
In-Reply-To: <20190911013623.36897-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: tsbogend@alpha.franken.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 11 Sep 2019 09:36:23 +0800

> sonic_send_packet will be processed in irq or non-irq 
> context, so it would better use dev_kfree_skb_any
> instead of dev_kfree_skb.
> 
> Fixes: d9fb9f384292 ("*sonic/natsemi/ns83829: Move the National Semi-conductor drivers")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
