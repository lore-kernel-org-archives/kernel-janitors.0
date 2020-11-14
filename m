From: Stephen Boyd <sboyd@kernel.org>
Date: Sat, 14 Nov 2020 17:04:13 +0000
Subject: Re: [PATCH] clk: qcom: lpass-sc7180: Clean up on error in lpass_sc7180_init()
Message-Id: <160537345343.60232.8506254322830181377@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101419.GC168908@mwanda>
In-Reply-To: <20201113101419.GC168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2020-11-13 02:14:19)
> Clean up the first driver if the second driver can't be registered.
> 
> Fixes: 4ee9fe3e292b ("clk: qcom: lpass-sc7180: Disentangle the two clock devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next
