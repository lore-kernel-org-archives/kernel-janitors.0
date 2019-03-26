From: David Miller <davem@davemloft.net>
Date: Tue, 26 Mar 2019 18:39:57 +0000
Subject: Re: [PATCH net-next v2] tipc: fix return value check in tipc_mcast_send_sync()
Message-Id: <20190326.113957.1854463876541529497.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321085810.96037-1-weiyongjun1@huawei.com>
        <20190325063109.173692-1-weiyongjun1@huawei.com>
In-Reply-To: <20190325063109.173692-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, hoang.h.le@dektech.com.au, eric.dumazet@gmail.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 25 Mar 2019 06:31:09 +0000

> Fix the return value check which testing the wrong variable
> in tipc_mcast_send_sync().
> 
> Fixes: c55c8edafa91 ("tipc: smooth change between replicast and broadcast")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: add reported-by

Applied.
