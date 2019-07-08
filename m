From: David Miller <davem@davemloft.net>
Date: Mon, 08 Jul 2019 02:35:04 +0000
Subject: Re: [PATCH net-next] gve: Fix error return code in gve_alloc_qpls()
Message-Id: <20190707.193504.258563830031901437.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705011642.156707-1-weiyongjun1@huawei.com>
In-Reply-To: <20190705011642.156707-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: csully@google.com, sagis@google.com, jonolson@google.com, colin.king@canonical.com, willemb@google.com, lrizzo@google.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 5 Jul 2019 01:16:42 +0000

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
