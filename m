From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 05 Aug 2020 06:40:47 +0000
Subject: Re: [PATCH -next] phy: qualcomm: fix return value check in qcom_ipq806x_usb_phy_probe()
Message-Id: <20200805062847.GT12965@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200723113622.136752-1-weiyongjun1@huawei.com>
In-Reply-To: <20200723113622.136752-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On 23-07-20, 11:36, Wei Yongjun wrote:
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.

Applied, thanks

-- 
~Vinod
