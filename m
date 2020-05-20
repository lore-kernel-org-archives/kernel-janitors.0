From: Shawn Guo <shawnguo@kernel.org>
Date: Wed, 20 May 2020 01:15:54 +0000
Subject: Re: [PATCH -next] firmware: imx: scu: Fix possible memory leak in imx_scu_probe()
Message-Id: <20200520011545.GI11739@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506051410.27219-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506051410.27219-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org

On Wed, May 06, 2020 at 05:14:10AM +0000, Wei Yongjun wrote:
> 'chan_name' is malloced in imx_scu_probe() and should be freed
> before leaving from the error handling cases, otherwise it will
> cause memory leak.
> 
> Fixes: edbee095fafb ("firmware: imx: add SCU firmware driver support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
