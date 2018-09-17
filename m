From: David Miller <davem@davemloft.net>
Date: Mon, 17 Sep 2018 15:07:19 +0000
Subject: Re: [PATCH net-next] net: dsa: gswip: Fix return value check in gswip_probe()
Message-Id: <20180917.080719.588392853959082460.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, hauke@hauke-m.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:33:21 +0000

> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: 14fceff4771e ("net: dsa: Add Lantiq / Intel DSA driver for vrx200")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
