From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Jan 2021 16:25:54 +0000
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
Message-Id: <CAD=FV=XMxHCs5bvjPGjENL2Sty=AD6CS3jYnESDG+qKJdiMU+Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210118113651.71955-1-colin.king@canonical.com> <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On Wed, Jan 20, 2021 at 1:58 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertions(+), 1 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
