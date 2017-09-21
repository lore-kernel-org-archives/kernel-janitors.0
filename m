From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Sep 2017 11:37:16 +0000
Subject: Re: [PATCH][pinctrl-next] pinctrl/amd: make functions amd_gpio_suspend and amd_gpio_resume static
Message-Id: <CACRpkdYeOgyS45V8xWFy0OTdrb-h-xfy6X=q6BPv3uqO-1KxNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170913161501.7356-1-colin.king@canonical.com>
In-Reply-To: <20170913161501.7356-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 13, 2017 at 6:15 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The functions amd_gpio_suspend and amd_gpio_resume are local to the
> source and do not need to be in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'amd_gpio_suspend' was not declared. Should it be static?
> symbol 'amd_gpio_resume' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Daniel's review tag.

Yours,
Linus Walleij
