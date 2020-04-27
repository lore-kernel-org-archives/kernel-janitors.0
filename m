From: Vladimir Zapolskiy <vz@mleia.com>
Date: Mon, 27 Apr 2020 13:24:40 +0000
Subject: Re: [PATCH net-next] net: lpc-enet: fix error return code in lpc_mii_init()
Message-Id: <936fc5fb-25a1-8974-71e2-80c2c4bdd0f4@mleia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427121507.23249-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427121507.23249-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, "stigge @ antcom . de" <stigge@antcom.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

On 4/27/20 3:15 PM, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: b7370112f519 ("lpc32xx: Added ethernet driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
