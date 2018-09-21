From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Sep 2018 15:18:08 +0000
Subject: Re: [PATCH -next] pinctrl: qcom: spmi-mpp: Fix err handling of pmic_mpp_set_mux
Message-Id: <CACRpkdaeoKvaAkAFUL3n7Z9r3zU2GhnvdxekxjKuPS1nLcAMpQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537408698-196297-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537408698-196297-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 19, 2018 at 6:48 PM YueHaibing <yuehaibing@huawei.com> wrote:

> 'ret' should be returned while pmic_mpp_write_mode_ctl fails.
>
> Fixes: 0e948042c420 ("pinctrl: qcom: spmi-mpp: Implement support for sink mode")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
