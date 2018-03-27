From: David Miller <davem@davemloft.net>
Date: Tue, 27 Mar 2018 14:50:51 +0000
Subject: Re: [PATCH net-next] tipc: tipc_node_create() can be static
Message-Id: <20180327.105051.2006933632591375740.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522074793-22753-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522074793-22753-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: kernel-janitors@vger.kernel.org, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 14:33:13 +0000

> Fixes the following sparse warning:
> 
> net/tipc/node.c:336:18: warning:
>  symbol 'tipc_node_create' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
