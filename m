From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 20 Jan 2021 18:32:41 +0000
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
Message-Id: <161116756167.3661239.9611045261884718600@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2021-01-20 01:57:55)
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
> 
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
