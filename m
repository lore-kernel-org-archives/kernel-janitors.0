From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2020 10:43:44 +0000
Subject: Re: [PATCH 08/16] pinctrl: ssbi-mpp: constify copied structure
Message-Id: <CACRpkdYQfiuziMyu+oCyh-8wmgpzVY7V5+CPNqoSLm3+ZEFmVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-9-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-9-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Andy Gross <agross@kernel.org>, kernel-janitors@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, MSM <linux-arm-msm@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The pm8xxx_pinctrl_desc structure is only copied into another structure,
> so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

That's a pretty cool semantic check finding things like this!

Patch applied.

Yours,
Linus Walleij
