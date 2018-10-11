From: David Miller <davem@davemloft.net>
Date: Thu, 11 Oct 2018 05:54:47 +0000
Subject: Re: [PATCH -next] phy: phy-ocelot-serdes: fix return value check in serdes_probe()
Message-Id: <20181010.225447.2264091665828087261.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539136824-44940-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1539136824-44940-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: kishon@ti.com, quentin.schulz@bootlin.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 10 Oct 2018 02:00:24 +0000

> In case of error, the function syscon_node_to_regmap() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: 51f6b410fc22 ("phy: add driver for Microsemi Ocelot SerDes muxing")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
