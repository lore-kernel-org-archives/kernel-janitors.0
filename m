From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 03:29:53 +0000
Subject: Re: [PATCH net-next] net: lpc-enet: fix error return code in lpc_mii_init()
Message-Id: <20200430.202953.2091105199865668501.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427121507.23249-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427121507.23249-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: stigge@antcom.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, vz@mleia.com, linaro-mm-sig@lists.linaro.org, slemieux.tyco@gmail.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 12:15:07 +0000

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: b7370112f519 ("lpc32xx: Added ethernet driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
