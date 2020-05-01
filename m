From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 03:28:47 +0000
Subject: Re: [PATCH net-next] octeontx2-pf: Fix error return code in otx2_probe()
Message-Id: <20200430.202847.1797161927869340111.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427121110.8446-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427121110.8446-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 12:11:10 +0000

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 5a6d7c9daef3 ("octeontx2-pf: Mailbox communication with AF")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
