From: David Miller <davem@davemloft.net>
Date: Wed, 26 Sep 2018 17:31:54 +0000
Subject: Re: [PATCH net-next] net/core: make function ___gnet_stats_copy_basic() static
Message-Id: <20180926.103154.1915916036667896505.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537963785-165570-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537963785-165570-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: john.fastabend@gmail.com, toke@toke.dk, echaudro@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:09:45 +0000

> Fixes the following sparse warning:
> 
> net/core/gen_stats.c:166:1: warning:
>  symbol '___gnet_stats_copy_basic' was not declared. Should it be static?
> 
> Fixes: 5e111210a443 ("net/core: Add new basic hardware counter")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
