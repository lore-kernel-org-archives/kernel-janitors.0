From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Jan 2021 17:55:38 +0000
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
Message-Id: <CAA8EJprP4xm=15Ss540uf0VW1-oXA0Sjr6pmTv_deXvjOqL4tg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210118113651.71955-1-colin.king@canonical.com> <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 20 Jan 2021 at 12:58, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
