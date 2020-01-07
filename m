From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2020 10:44:27 +0000
Subject: Re: [PATCH 14/16] pinctrl: qcom: ssbi-gpio: constify copied structure
Message-Id: <CACRpkdackV3fDDr4SKPc-GVcW3TcCCYvumN4ibfPcvdfnBdHzA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, kernel-janitors@vger.kernel.org, Andy Gross <agross@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The pm8xxx_pinctrl_desc structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
