From: David Miller <davem@davemloft.net>
Date: Tue, 27 Mar 2018 14:50:46 +0000
Subject: Re: [PATCH net-next] tipc: fix error handling in tipc_udp_enable()
Message-Id: <20180327.105046.391878908613679018.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522074764-22678-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522074764-22678-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 14:32:44 +0000

> Release alloced resource before return from the error handling
> case in tipc_udp_enable(), otherwise will cause memory leak.
> 
> Fixes: 52dfae5c85a4 ("tipc: obtain node identity from interface by default")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
