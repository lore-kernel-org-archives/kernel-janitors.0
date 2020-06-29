From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 29 Jun 2020 21:15:36 +0000
Subject: Re: [PATCH -next] clk: qcom: Fix return value check in apss_ipq6018_probe()
Message-Id: <159346533636.62212.17293772427230982378@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200628023055.50608-1-weiyongjun1@huawei.com>
In-Reply-To: <20200628023055.50608-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Sivaprakash Murugesan <sivaprak@codeaurora.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Quoting Wei Yongjun (2020-06-27 19:30:55)
> In case of error, the function dev_get_regmap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next
