From: David Miller <davem@davemloft.net>
Date: Wed, 26 Sep 2018 17:32:01 +0000
Subject: Re: [PATCH net-next] net/tls: Make function get_rec() static
Message-Id: <20180926.103201.945000686527143288.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537963848-166323-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537963848-166323-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: borisp@mellanox.com, aviadye@mellanox.com, davejwatson@fb.com, vakul.garg@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:10:48 +0000

> Fixes the following sparse warning:
> 
> net/tls/tls_sw.c:655:16: warning:
>  symbol 'get_rec' was not declared. Should it be static?
> 
> Fixes: a42055e8d2c3 ("net/tls: Add support for async encryption of records for performance")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
