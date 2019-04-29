From: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 29 Apr 2019 13:56:03 +0000
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw: Fix inconsistent IS_ERR and PTR_ERR in cpsw_probe()
Message-Id: <20190429135603.GI10772@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190429135650.72794-1-yuehaibing@huawei.com>
In-Reply-To: <20190429135650.72794-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-omap@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 29, 2019 at 01:56:50PM +0000, YueHaibing wrote:
> Change the call to PTR_ERR to access the value just tested by IS_ERR.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Please could you add a Fixes: tag.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
