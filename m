From: David Miller <davem@davemloft.net>
Date: Mon, 17 Sep 2018 15:07:24 +0000
Subject: Re: [PATCH net-next] net: lantiq: Fix return value check in xrx200_probe()
Message-Id: <20180917.080724.2088373610597772187.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: hauke@hauke-m.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:33:50 +0000

> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: fe1a56420cf2 ("net: lantiq: Add Lantiq / Intel VRX200 Ethernet driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
