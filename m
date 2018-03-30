From: David Miller <davem@davemloft.net>
Date: Fri, 30 Mar 2018 13:52:37 +0000
Subject: Re: [PATCH net-next] cxgb4: fix error return code in adap_init0()
Message-Id: <20180330.095237.1631646121610643762.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522241469-77623-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522241469-77623-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: ganeshgr@chelsio.com, kumaras@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:09 +0000

> Fix to return a negative error code from the hash filter init error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 5c31254e35a8 ("cxgb4: initialize hash-filter configuration")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks Wei.
