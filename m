From: David Miller <davem@davemloft.net>
Date: Thu, 07 Nov 2019 05:22:22 +0000
Subject: Re: [PATCH net-next] net: aquantia: fix return value check in aq_ptp_init()
Message-Id: <20191106.212222.483687585896701702.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106145921.124814-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106145921.124814-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: epomozov@marvell.com, igor.russkikh@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 6 Nov 2019 14:59:21 +0000

> Function ptp_clock_register() returns ERR_PTR() and never returns
> NULL. The NULL test should be removed.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
