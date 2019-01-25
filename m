From: David Miller <davem@davemloft.net>
Date: Fri, 25 Jan 2019 06:13:47 +0000
Subject: Re: [PATCH net-next] net: stmmac: Fix return value check in qcom_ethqos_probe()
Message-Id: <20190124.221347.1855347214634112498.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548224358-83281-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1548224358-83281-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, vkoul@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, niklas.cassel@linaro.org, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 23 Jan 2019 06:19:18 +0000

> In case of error, the function devm_clk_get() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
