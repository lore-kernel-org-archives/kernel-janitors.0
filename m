From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 10 Sep 2019 10:23:00 +0000
Subject: Re: [PATCH net] net: sonic: replace dev_kfree_skb in sonic_send_packet
Message-Id: <a48a6690-eeb4-91d2-bed8-439d14b63e2f@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190910085848.144780-1-maowenan@huawei.com>
In-Reply-To: <20190910085848.144780-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, tsbogend@alpha.franken.de, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello!

On 10.09.2019 11:58, Mao Wenan wrote:

> sonic_send_packet will be processed in irq or none

    s/none irq/non-irq/?

> irq context, so it would better use dev_kfree_skb_any
> instead of dev_kfree_skb.
> 
> Fixes: d9fb9f384292 ("*sonic/natsemi/ns83829: Move the National Semi-conductor drivers")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
[...]

MBR, Sergei
