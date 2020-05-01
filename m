From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 03:39:44 +0000
Subject: Re: [PATCH net-next] net: ll_temac: Fix return value check in temac_probe()
Message-Id: <20200430.203944.1500164412783078570.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427094052.181554-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427094052.181554-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: andrew@lunn.ch, netdev@vger.kernel.org, esben@geanix.com, kernel-janitors@vger.kernel.org, michal.simek@xilinx.com, ynezz@true.cz, linux-arm-kernel@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 09:40:52 +0000

> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
