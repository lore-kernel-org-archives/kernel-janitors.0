From: David Miller <davem@davemloft.net>
Date: Sun, 03 Jun 2018 14:35:53 +0000
Subject: Re: [PATCH net-next] hv_netvsc: fix error return code in netvsc_probe()
Message-Id: <20180603.103553.2303446828561829445.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527732283-145530-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527732283-145530-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, sridhar.samudrala@intel.com, devel@linuxdriverproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 31 May 2018 02:04:43 +0000

> Fix to return a negative error code from the failover register fail
> error handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 1ff78076d8dd ("netvsc: refactor notifier/event handling code to use the failover framework")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
